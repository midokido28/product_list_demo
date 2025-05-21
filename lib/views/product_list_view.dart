import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_demo/controller/product_controller.dart';
import 'package:product_list_demo/widgets/product_item.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final controller = Get.put(ProductController());
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !controller.isLoading.value) {
          controller.fetchSearchResults(loadMore: true);
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (val) {
                controller.search(val);
              },
              decoration: const InputDecoration(
                hintText: 'Search product...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return ListView.builder(
          controller: scrollController,
          itemCount:
              controller.products.length + (controller.hasMore.value ? 1 : 0),
          itemBuilder: (_, index) {
            if (index >= controller.products.length) {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ));
            }

            return Obx(() {
              final product = controller.products[index];
              final isFavorite = controller.favorites.contains(product.id);
              return ProductItem(
                product: product,
                isFavorite: isFavorite,
                onFavoriteToggle: () {
                  controller.toggleFavorite(product.id);
                },
              );
            });
          },
        );
      }),
    );
  }
}
