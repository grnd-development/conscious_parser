// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

@JsonSerializable()
class ProductsListResponseModel {
  List<ProductResponseModel>? products;
  int? page;

  ProductsListResponseModel({this.products, this.page});

  factory ProductsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListResponseModelToJson(this);
}

@JsonSerializable()
class ProductResponseModel {
  @JsonKey(name: '_id')
  dynamic id;
  @JsonKey(name: 'product_name_en')
  String? productNameEn;
  @JsonKey(name: 'generic_name')
  String? genericName;
  String? brands;
  @JsonKey(name: 'ingredients_text')
  String? ingredientsText;
  String? categories;
  @JsonKey(name: 'categories_lc')
  String? categoriesLc;
  String? labels;
  String? link;
  String? stores;
  String? allergens;
  String? packaging;
  String? quantity;
  @JsonKey(name: 'ecoscore_data')
  EcoScoreDataModel? ecoScoreData;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'need_water')
  double? needWater;
  List<String>? facts;

  ProductResponseModel(
      {this.id,
      this.productNameEn,
      this.brands,
      this.ingredientsText,
      this.categories,
      this.categoriesLc,
      this.labels,
      this.link,
      this.stores,
      this.allergens,
      this.packaging,
      this.quantity,
      this.ecoScoreData,
      this.needWater,
      this.facts});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseModelToJson(this);

  ProductModel toProductModel(ProductResponseModel product) => ProductModel(
        id: getId(product.id),
        name: product.productNameEn?.isNotEmpty ?? false
            ? product.productNameEn
            : product.genericName,
        brands: product.brands.toString(),
        ingredientsText: product.ingredientsText,
        categories: product.categoriesLc == "en"
            ? product.categories.toString()
            : "null",
        labels: (product.labels?.isNotEmpty ?? false ? product.labels : "null")
            .toString()
            .truncateString(),
        link: (product.link?.isNotEmpty ?? false ? product.link : "null")
            ?.truncateString(),
        stores: (product.stores?.isNotEmpty ?? false ? product.stores : "null")
            .toString(),
        allergens:
            product.allergens?.isNotEmpty ?? false ? product.allergens : "null",
        packaging: (product.packaging?.isNotEmpty ?? false)
            ? product.packaging
            : "null",
        quantity:
            (product.quantity?.isNotEmpty ?? false) ? product.quantity : "null",
        needWater: product.needWater,
        facts: jsonEncode(product.facts),
        miles: product.ecoScoreData?.miles,
        submissionImage: product.imageUrl,
        co2Total: getCo2(product),
        barcode: product.id.toString(),
      );

  getId(id) {
    if (id.runtimeType == String) {
      return int.tryParse(id);
    } else {
      return id;
    }
  }
}

@JsonSerializable()
class ProductsListModel {
  List<ProductModel>? products;
  int? page;

  ProductsListModel({this.products, this.page});

  factory ProductsListModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListModelToJson(this);
}

@JsonSerializable()
class ProductModel {
  int? id;
  String? name;
  String? brands;
  @JsonKey(name: 'ingredients_text')
  String? ingredientsText;
  String? categories;
  String? labels;
  String? link;
  String? stores;
  String? allergens;
  String? packaging;
  String? quantity;
  @JsonKey(name: 'submission_image')
  String? submissionImage;
  @JsonKey(name: 'need_water')
  double? needWater;
  String? facts;
  double? miles;
  @JsonKey(name: 'co2_total')
  double? co2Total;
  String? barcode;
  @JsonKey(name: 'is_favorited')
  bool? isFavorited;

  ProductModel(
      {this.id,
      this.name,
      this.brands,
      this.ingredientsText,
      this.categories,
      this.labels,
      this.link,
      this.stores,
      this.allergens,
      this.packaging,
      this.quantity,
      this.submissionImage,
      this.needWater,
      this.facts,
      this.miles,
      this.co2Total,
      this.barcode,
      this.isFavorited});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class EcoScoreDataModel {
  @JsonKey(name: 'previous_data')
  PreviousDataModel? previousData;

  EcoScoreDataModel({this.previousData});

  factory EcoScoreDataModel.fromJson(Map<String, dynamic> json) =>
      _$EcoScoreDataModelFromJson(json);

  get miles => null;

  Map<String, dynamic> toJson() => _$EcoScoreDataModelToJson(this);
}

@JsonSerializable()
class PreviousDataModel {
  AgribalyseModel? agribalyse;

  PreviousDataModel({this.agribalyse});

  factory PreviousDataModel.fromJson(Map<String, dynamic> json) =>
      _$PreviousDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreviousDataModelToJson(this);
}

@JsonSerializable()
class AgribalyseModel {
  @JsonKey(name: 'co2_total')
  dynamic co2Total;

  AgribalyseModel({this.co2Total});

  factory AgribalyseModel.fromJson(Map<String, dynamic> json) =>
      _$AgribalyseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgribalyseModelToJson(this);
}

@JsonSerializable()
class StorageModel {
  int? page;

  StorageModel({this.page});

  factory StorageModel.fromJson(Map<String, dynamic> json) =>
      _$StorageModelFromJson(json);

  Map<String, dynamic> toJson() => _$StorageModelToJson(this);
}

@JsonSerializable()
class ResponseModel {
  final String? message;
  final dynamic errors;
  final dynamic data;

  ResponseModel({required this.message, required this.errors, this.data});

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

@JsonSerializable()
class Errors {
  final List<String>? barcode;

  Errors({required this.barcode});

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}

double? getCo2(ProductResponseModel product) {
  final co2 = product.ecoScoreData?.previousData?.agribalyse?.co2Total;
  if (co2 == null) {
    return 0;
  } else if (co2.runtimeType == String) {
    return double.parse(co2) * 100;
  } else {
    return co2 * 100;
  }
}

extension StringExtension on String {
  String truncateString() {
    const int maxLength = 200;
    if (this.length <= maxLength) {
      return this;
    } else {
      return this.substring(0, maxLength) + '...';
    }
  }
}
