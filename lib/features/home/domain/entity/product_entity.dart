import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String productName;
  final int productPrice;
  final String productCategory;
  final String productDescription;
  final String productImage;

  const ProductEntity({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
  });

  @override
  List<Object?> get props => [
        id,
        productName,
        productPrice,
        productCategory,
        productDescription,
        productImage
      ];
}
