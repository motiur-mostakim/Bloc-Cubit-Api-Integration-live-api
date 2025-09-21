import 'package:bloc_cubit_api_integrate/bloc/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/model/products.dart';
import '../features/provider/repository.dart';
import 'api_result.dart';

class ProductCubit extends Cubit<ResultState<List<Products>>> {
  final ShopRepository shopRepository;

  List<Products> _products = [];
  int _page = 1;
  final int _limit = 20;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  bool get hasMore => _hasMore;

  ProductCubit({required this.shopRepository}) : super(const Idle());

  Future<void> loadProducts({bool isLoadMore = false}) async {
    if (isLoadMore) {
      if (!_hasMore || _isLoadingMore) return;
      _isLoadingMore = true;
      _page++; // next page
    } else {
      emit(const ResultState.loading());
      _products.clear();
      _page = 1;
      _hasMore = true;
    }

    final ApiResult<List<Products>> apiResult =
    await shopRepository.fetchProducts(limit: _limit, page: _page);

    apiResult.when(
      success: (data) {
        if (data.length < _limit) {
          _hasMore = false;
        }
        _products.addAll(data);
        emit(ResultState.data(data: List.from(_products)));
        _isLoadingMore = false;
      },
      failure: (error) {
        emit(ResultState.error(error: error));
        _isLoadingMore = false;
      },
    );
  }
}



