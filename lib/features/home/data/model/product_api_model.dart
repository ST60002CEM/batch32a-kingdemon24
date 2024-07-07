

import 'package:equatable/equatable.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_api_model.g.dart';

//provider
final productApiModelProvider =
    Provider<ProductApiModel>((ref) => const ProductApiModel.empty());

@JsonSerializable()
class ProductApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String productName;
  final int productPrice;
  final String productImage;
  final String productDescription;
  final String productCategory;

  const ProductApiModel({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productDescription,
    required this.productCategory,
  });

  const ProductApiModel.empty()
      : id = '',
        productName = '',
        productPrice = 0,
        productImage = '',
        productCategory = '',
        productDescription = '';

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductApiModelToJson(this);

  // To Entity
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      productName: productName,
      productPrice: productPrice,
      productImage: productImage,
      productCategory: productCategory,
      productDescription: productDescription,
    );
  }

  //Convert Entity to API Object
  factory ProductApiModel.fromEntity(ProductEntity entity) {
    return ProductApiModel(
      id: entity.id,
      productName: entity.productName,
      productPrice: entity.productPrice,
      productImage: entity.productImage,
      productCategory: entity.productCategory,
      productDescription: entity.productDescription,
    );
  }

  //Convert API List to Entity List
  List<ProductEntity> toEntityList(List<ProductApiModel> products) {
    return products.map((product) => product.toEntity()).toList();
  }

  List<ProductApiModel> fromEntityList(List<ProductEntity> products) {
    return products.map((product) => ProductApiModel.fromEntity(product)).toList();
  }

  @override
  List<Object?> get props => [
        id,
        productName,
        productImage,
        productPrice,
        productCategory,
        productDescription
      ];
}
