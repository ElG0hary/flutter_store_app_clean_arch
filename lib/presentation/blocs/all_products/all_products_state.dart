part of 'all_products_bloc.dart';

abstract class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

class AllProductsInitial extends AllProductsState {}

class GetAllProductsState extends AllProductsState {
  final List<Product>? productsList;
  final String productsErrorMessage;
  final RequestState productsRequestState;

  const GetAllProductsState({
    this.productsList,
    this.productsErrorMessage = '',
    this.productsRequestState = RequestState.loading,
  });
}
