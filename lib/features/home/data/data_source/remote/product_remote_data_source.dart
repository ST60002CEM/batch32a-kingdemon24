import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:final_assignment/features/home/data/dto/pagination_dto.dart';
import 'package:final_assignment/features/home/data/model/product_api_model.dart';
import 'package:final_assignment/features/home/domain/entity/product_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRemoteDataSourceProvider =
    Provider<ProductRemoteDataSource>((ref) {
  final dio = ref.watch(httpServiceProvider);
  final productApiModel = ref.watch(productApiModelProvider);
  final userSharedPrefs = ref.watch(userSharedPrefsProvider);
  return ProductRemoteDataSource(
    dio: dio,
    productApiModel: productApiModel, 
    userSharedPrefs: userSharedPrefs,
  );
});

class ProductRemoteDataSource {
  final Dio dio;
  final ProductApiModel productApiModel;
  final UserSharedPrefs userSharedPrefs;

  ProductRemoteDataSource({
    required this.dio,
    required this.productApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, List<ProductEntity>>> pagination(
      {required int page, required int limit}) async {
    try {
      final token = await userSharedPrefs.getUserToken();
      token.fold((l) => throw Failure(error: l.error), (r) => r);
      final response = await dio.get(
        ApiEndpoints.paginatonProducts,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
        options: Options(
          headers: {
            'authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 201) {
        final paginationDto = PaginationDto.fromJson(response.data);
        return Right(productApiModel.toEntityList(paginationDto.products));
      }
      return Left(Failure(
          error: response.data['message'],
          statusCode: response.statusCode.toString()));
    } on DioException catch (e) {
      return Left(Failure(error: e.error.toString()));
    }
  }
}
