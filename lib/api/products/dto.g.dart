// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsListResponseModel _$ProductsListResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductsListResponseModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsListResponseModelToJson(
        ProductsListResponseModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'page': instance.page,
    };

ProductResponseModel _$ProductResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProductResponseModel(
      id: json['_id'],
      productNameEn: json['product_name_en'] as String?,
      brands: json['brands'] as String?,
      ingredientsText: json['ingredients_text'] as String?,
      categories: json['categories'] as String?,
      categoriesLc: json['categories_lc'] as String?,
      labels: json['labels'] as String?,
      link: json['link'] as String?,
      stores: json['stores'] as String?,
      allergens: json['allergens'] as String?,
      packaging: json['packaging'] as String?,
      quantity: json['quantity'] as String?,
      ecoScoreData: json['ecoscore_data'] == null
          ? null
          : EcoScoreDataModel.fromJson(
              json['ecoscore_data'] as Map<String, dynamic>),
      needWater: (json['need_water'] as num?)?.toDouble(),
      facts:
          (json['facts'] as List<dynamic>?)?.map((e) => e as String).toList(),
    )
      ..genericName = json['generic_name'] as String?
      ..imageUrl = json['image_url'] as String?;

Map<String, dynamic> _$ProductResponseModelToJson(
        ProductResponseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product_name_en': instance.productNameEn,
      'generic_name': instance.genericName,
      'brands': instance.brands,
      'ingredients_text': instance.ingredientsText,
      'categories': instance.categories,
      'categories_lc': instance.categoriesLc,
      'labels': instance.labels,
      'link': instance.link,
      'stores': instance.stores,
      'allergens': instance.allergens,
      'packaging': instance.packaging,
      'quantity': instance.quantity,
      'ecoscore_data': instance.ecoScoreData,
      'image_url': instance.imageUrl,
      'need_water': instance.needWater,
      'facts': instance.facts,
    };

ProductsListModel _$ProductsListModelFromJson(Map<String, dynamic> json) =>
    ProductsListModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductsListModelToJson(ProductsListModel instance) =>
    <String, dynamic>{
      'products': instance.products,
      'page': instance.page,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      brands: json['brands'] as String?,
      ingredientsText: json['ingredients_text'] as String?,
      categories: json['categories'] as String?,
      labels: json['labels'] as String?,
      link: json['link'] as String?,
      stores: json['stores'] as String?,
      allergens: json['allergens'] as String?,
      packaging: json['packaging'] as String?,
      quantity: json['quantity'] as String?,
      submissionImage: json['submission_image'] as String?,
      needWater: (json['need_water'] as num?)?.toDouble(),
      facts: json['facts'] as String?,
      miles: (json['miles'] as num?)?.toDouble(),
      co2Total: (json['co2_total'] as num?)?.toDouble(),
      barcode: json['barcode'] as String?,
      isFavorited: json['is_favorited'] as bool?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brands': instance.brands,
      'ingredients_text': instance.ingredientsText,
      'categories': instance.categories,
      'labels': instance.labels,
      'link': instance.link,
      'stores': instance.stores,
      'allergens': instance.allergens,
      'packaging': instance.packaging,
      'quantity': instance.quantity,
      'submission_image': instance.submissionImage,
      'need_water': instance.needWater,
      'facts': instance.facts,
      'miles': instance.miles,
      'co2_total': instance.co2Total,
      'barcode': instance.barcode,
      'is_favorited': instance.isFavorited,
    };

EcoScoreDataModel _$EcoScoreDataModelFromJson(Map<String, dynamic> json) =>
    EcoScoreDataModel(
      previousData: json['previous_data'] == null
          ? null
          : PreviousDataModel.fromJson(
              json['previous_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EcoScoreDataModelToJson(EcoScoreDataModel instance) =>
    <String, dynamic>{
      'previous_data': instance.previousData,
    };

PreviousDataModel _$PreviousDataModelFromJson(Map<String, dynamic> json) =>
    PreviousDataModel(
      agribalyse: json['agribalyse'] == null
          ? null
          : AgribalyseModel.fromJson(
              json['agribalyse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreviousDataModelToJson(PreviousDataModel instance) =>
    <String, dynamic>{
      'agribalyse': instance.agribalyse,
    };

AgribalyseModel _$AgribalyseModelFromJson(Map<String, dynamic> json) =>
    AgribalyseModel(
      co2Total: json['co2_total'],
    );

Map<String, dynamic> _$AgribalyseModelToJson(AgribalyseModel instance) =>
    <String, dynamic>{
      'co2_total': instance.co2Total,
    };

StorageModel _$StorageModelFromJson(Map<String, dynamic> json) => StorageModel(
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StorageModelToJson(StorageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
    };

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      message: json['message'] as String?,
      errors: json['errors'],
      data: json['data'],
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
      'data': instance.data,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      barcode:
          (json['barcode'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'barcode': instance.barcode,
    };
