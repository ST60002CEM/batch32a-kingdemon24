import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';

import 'package:final_assignment/features/home/data/data_source/remote/product_remote_data_source.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:final_assignment/features/home/domain/repository/product_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRemoteRepository = Provider<IProductRepository>((ref) {
  final productRemoteDataSource = ref.watch(productRemoteDataSourceProvider);
  return ProductRemoteRepository(
      productRemoteDataSource: productRemoteDataSource);
});

class ProductRemoteRepository implements IProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRemoteRepository({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> pagination(int page, int limit) {
    return productRemoteDataSource.pagination(page: page, limit: limit);
  }
  
  
}
