import 'package:bloc_cubit_api_integrate/without_pagination/bloc/result_state.dart';
import 'package:bloc_cubit_api_integrate/without_pagination/features/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/provider/repository.dart';
import 'api_result.dart';

class CategoriesCubit extends Cubit<ResultState<List<Categories>>> {
  final ShopRepository shopRepository;

  CategoriesCubit({required this.shopRepository}) : super(const Idle());

  Future<void> loadCategories(BuildContext context,) async {
    emit(const ResultState.loading());
    final ApiResult<List<Categories>> apiResult =
    await shopRepository.fetchCategories();
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
