// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductApiModel _$ProductApiModelFromJson(Map<String, dynamic> json) =>
    ProductApiModel(
      id: json['_id'] as String?,
      productName: json['productName'] as String,
      productPrice: (json['productPrice'] as num).toInt(),
      productImage: json['productImage'] as String,
      productDescription: json['productDescription'] as String,
      productCategory: json['productCategory'] as String,
    );

Map<String, dynamic> _$ProductApiModelToJson(ProductApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productImage': instance.productImage,
      'productDescription': instance.productDescription,
      'productCategory': instance.productCategory,
    };
