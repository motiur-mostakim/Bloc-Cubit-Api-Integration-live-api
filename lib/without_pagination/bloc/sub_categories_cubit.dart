import 'package:bloc_cubit_api_integrate/without_pagination/bloc/result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/model/products.dart';
import '../features/provider/repository.dart';
import 'api_result.dart';

class SubCategoriesCubit extends Cubit<ResultState<List<Products>>> {
  final ShopRepository shopRepository;

  SubCategoriesCubit({required this.shopRepository}) : super(const Idle());

  Future<void> loadSubProducts(BuildContext context, String categorySlug) async {
    emit(const ResultState.loading());
    final ApiResult<List<Products>> apiResult =
    await shopRepository.subCategoriesProduct(categorySlug);
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
