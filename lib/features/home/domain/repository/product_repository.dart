import 'package:dartz/dartz.dart';

import 'package:final_assignment/core/common/provider/internet_connectivity.dart';

import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/home/data/repository/product_remote_repository.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider<IProductRepository>
    // ((ref) => ref.read(productRemoteRepository));
    ((ref) {
  final checkConnectivity = ref.watch(connectivityStatusProvider);
  if (checkConnectivity == ConnectivityStatus.isConnected) {
    return ref.read(productRemoteRepository);
  } else {
    // return ref.read(productLocalRepositoryProvider);
    return ref.read(productRemoteRepository);
  }
});
final productRepositoryProvider =
    Provider<IProductRepository>((ref) => ref.read(productRemoteRepository));


abstract class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> pagination(int page, int limit);
}
