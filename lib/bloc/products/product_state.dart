import 'package:equatable/equatable.dart';
import 'package:trainingassignment/model/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitialState extends ProductState {
  const ProductInitialState();
  @override
  List<Object> get props => [];
}

class ProductSuccessState extends ProductState {
  final List<MsProduct> data;
  const ProductSuccessState(this.data);
  @override
  List<Object> get props => [data];
}

class ProductLoadingState extends ProductState {}

class ProductErrorState extends ProductState {
  final String errMessage;

  const ProductErrorState(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
