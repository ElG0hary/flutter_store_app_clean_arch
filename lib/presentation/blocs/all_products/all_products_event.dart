part of 'all_products_bloc.dart';

abstract class AllProductsEvent extends Equatable {
  const AllProductsEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends AllProductsEvent{}