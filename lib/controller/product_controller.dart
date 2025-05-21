import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_demo/models/product.dart';
import 'package:product_list_demo/service/product_service.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;
  final favorites = <int>{}.obs;
  final searchQuery = ''.obs;
  final _api = ProductApi();

  int page = 0;
  final int pageSize = 10;
  var isLoading = false.obs;
  var hasMore = true.obs;

  bool _hasShownNoMoreData = false;

  Timer? _debounce;

  Future<void> search(String query) async {
    if (query != searchQuery.value) {
      searchQuery.value = query;
      _resetSearch();
      _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        await fetchSearchResults();
      });
    }
  }

  void _resetSearch() {
    page = 0;
    products.clear();
    hasMore.value = true;
    _hasShownNoMoreData = false;
  }

  Future<bool> _checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showDialogPopup(
        'No Internet Connection',
        'Please check your network settings.',
      );
      return false;
    }else{
      return true;
    }
  }

  Future<void> fetchSearchResults({bool loadMore = false}) async {
    if(!await _checkConnection()) return;
    if (isLoading.value || searchQuery.value.isEmpty) return;


    if (loadMore && !hasMore.value) {
      if (!_hasShownNoMoreData) {
        _hasShownNoMoreData = true;
        Get.snackbar('Alert', 'End reached',
            snackPosition: SnackPosition.BOTTOM);
      }
      return;
    }
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      final response = await _api.searchProducts(
        query: searchQuery.value,
        page: page,
        limit: pageSize,
      );
      final newProducts = response.products;

      if (loadMore) {
        products.addAll(newProducts);
      } else {
        products.clear();
        products.addAll(newProducts);
      }

      hasMore.value = newProducts.length == pageSize;
      page++;
    } catch (e) {
      Get.snackbar(
        'Alert',
        'Load data failed',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(int id) {
    if (favorites.contains(id)) {
      favorites.remove(id);
    } else {
      favorites.add(id);
    }
    update();
  }

  showDialogPopup(String title, String content) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
