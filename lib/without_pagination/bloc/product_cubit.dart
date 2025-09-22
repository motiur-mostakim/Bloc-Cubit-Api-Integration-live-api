import 'package:bloc_cubit_api_integrate/without_pagination/bloc/result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/model/products.dart';
import '../features/provider/repository.dart';
import 'api_result.dart';

class ProductCubit extends Cubit<ResultState<List<Products>>> {
  final ShopRepository shopRepository;

  ProductCubit({required this.shopRepository}) : super(const Idle());

  Future<void> loadProducts(BuildContext context, int limit) async {
    emit(const ResultState.loading());
    final ApiResult<List<Products>> apiResult =
        await shopRepository.fetchProducts(limit);
    apiResult.when(
      success: (data) {
        emit(ResultState.data(data: data));
      },
      failure: (error) {
        emit(ResultState.error(error: error));
      },
    );
  }
}
