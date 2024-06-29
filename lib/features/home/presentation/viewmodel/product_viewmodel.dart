import 'package:final_assignment/features/home/domain/usecases/product_usecase.dart';
import 'package:final_assignment/features/home/presentation/state/product_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productViewModelProvider =
    StateNotifierProvider<ProductViewmodel, ProductState>(
        (ref) => ProductViewmodel(
              productUsecase: ref.watch(productUsecaseProvider),
            ));

class ProductViewmodel extends StateNotifier<ProductState> {
  ProductViewmodel({required this.productUsecase})
      : super(ProductState.initial()) {
    getProducts();
  }

  final ProductUsecase productUsecase;

  Future resetState() async {
    state = ProductState.initial();
    getProducts();
  }

  Future getProducts() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final products = currentState.products;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      // get data from data source
      final result = await productUsecase.pagination(page, 6);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              products: [...products, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }
}
