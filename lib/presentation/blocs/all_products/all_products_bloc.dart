import 'dart:async';

import 'package:fakeshop/domain/usecases/get_all_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakeshop/core/utils/request_state.dart';
import 'package:fakeshop/domain/entities/product.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  final GetAllProductsUseCase _allProductsUseCase;
  AllProductsBloc(this._allProductsUseCase) : super(AllProductsInitial()) {
    on<GetAllProductsEvent>(_getAllProducts);
  }

  FutureOr<void> _getAllProducts(
      GetAllProductsEvent event, Emitter<AllProductsState> emit) async {
    final results = await _allProductsUseCase();
    results.fold(
      (l) => emit(
        GetAllProductsState(
          productsErrorMessage: l.message,
          productsRequestState: RequestState.error,
        ),
      ),
      (r) => emit(
        GetAllProductsState(
          productsList: r,
          productsRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
