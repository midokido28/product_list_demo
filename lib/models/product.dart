import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductResponse {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Product {
    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.tags,
        required this.brand,
        required this.sku,
        required this.weight,
        required this.dimensions,
        required this.warrantyInformation,
        required this.shippingInformation,
        required this.availabilityStatus,
        required this.reviews,
        required this.returnPolicy,
        required this.minimumOrderQuantity,
        required this.meta,
        required this.thumbnail,
        required this.images,
    });

    final int id;
    final String? title;
    final String? description;
    final String? category;
    final double? price;
    final double? discountPercentage;
    final double? rating;
    final int? stock;
    final List<String>? tags;
    final String? brand;
    final String? sku;
    final int? weight;
    final Dimensions? dimensions;
    final String? warrantyInformation;
    final String? shippingInformation;
    final String? availabilityStatus;
    final List<Review>? reviews;
    final String? returnPolicy;
    final int? minimumOrderQuantity;
    final Meta? meta;
    final String? thumbnail;
    final List<String>? images;

    Product copyWith({
        int? id,
        String? title,
        String? description,
        String? category,
        double? price,
        double? discountPercentage,
        double? rating,
        int? stock,
        List<String>? tags,
        String? brand,
        String? sku,
        int? weight,
        Dimensions? dimensions,
        String? warrantyInformation,
        String? shippingInformation,
        String? availabilityStatus,
        List<Review>? reviews,
        String? returnPolicy,
        int? minimumOrderQuantity,
        Meta? meta,
        String? thumbnail,
        List<String>? images,
    }) {
        return Product(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
            category: category ?? this.category,
            price: price ?? this.price,
            discountPercentage: discountPercentage ?? this.discountPercentage,
            rating: rating ?? this.rating,
            stock: stock ?? this.stock,
            tags: tags ?? this.tags,
            brand: brand ?? this.brand,
            sku: sku ?? this.sku,
            weight: weight ?? this.weight,
            dimensions: dimensions ?? this.dimensions,
            warrantyInformation: warrantyInformation ?? this.warrantyInformation,
            shippingInformation: shippingInformation ?? this.shippingInformation,
            availabilityStatus: availabilityStatus ?? this.availabilityStatus,
            reviews: reviews ?? this.reviews,
            returnPolicy: returnPolicy ?? this.returnPolicy,
            minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
            meta: meta ?? this.meta,
            thumbnail: thumbnail ?? this.thumbnail,
            images: images ?? this.images,
        );
    }

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

    Map<String, dynamic> toJson() => _$ProductToJson(this);

}

@JsonSerializable()
class Dimensions {
    Dimensions({
        required this.width,
        required this.height,
        required this.depth,
    });

    final double? width;
    final double? height;
    final double? depth;

    Dimensions copyWith({
        double? width,
        double? height,
        double? depth,
    }) {
        return Dimensions(
            width: width ?? this.width,
            height: height ?? this.height,
            depth: depth ?? this.depth,
        );
    }

    factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);

    Map<String, dynamic> toJson() => _$DimensionsToJson(this);

}

@JsonSerializable()
class Meta {
    Meta({
        required this.createdAt,
        required this.updatedAt,
        required this.barcode,
        required this.qrCode,
    });

    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? barcode;
    final String? qrCode;

    Meta copyWith({
        DateTime? createdAt,
        DateTime? updatedAt,
        String? barcode,
        String? qrCode,
    }) {
        return Meta(
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            barcode: barcode ?? this.barcode,
            qrCode: qrCode ?? this.qrCode,
        );
    }

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

    Map<String, dynamic> toJson() => _$MetaToJson(this);

}

@JsonSerializable()
class Review {
    Review({
        required this.rating,
        required this.comment,
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail,
    });

    final int? rating;
    final String? comment;
    final DateTime? date;
    final String? reviewerName;
    final String? reviewerEmail;

    Review copyWith({
        int? rating,
        String? comment,
        DateTime? date,
        String? reviewerName,
        String? reviewerEmail,
    }) {
        return Review(
            rating: rating ?? this.rating,
            comment: comment ?? this.comment,
            date: date ?? this.date,
            reviewerName: reviewerName ?? this.reviewerName,
            reviewerEmail: reviewerEmail ?? this.reviewerEmail,
        );
    }

    factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

    Map<String, dynamic> toJson() => _$ReviewToJson(this);

}
