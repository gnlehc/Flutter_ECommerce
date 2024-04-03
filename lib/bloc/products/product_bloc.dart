import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/bloc/products/product_event.dart';
import 'package:trainingassignment/bloc/products/product_state.dart';
import 'package:trainingassignment/service/product_service.dart';
import '../../model/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductService productService = ProductService();
  ProductBloc({required this.productService})
      : super(const ProductInitialState()) {
    on<FetchListProductData>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var res = await productService.getProduct();
        emit(ProductSuccessState(res.data!));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}

class DetailBloc extends Bloc<String, MsProduct> {
  ProductService productService = ProductService();
  DetailBloc()
      : super(MsProduct(
            id: 0,
            title: "",
            description: "",
            category: "",
            image: "",
            price: 0,
            rating: [])) {
    on<String>((event, emit) async {
      try {
        var res = await productService.getProductsfromId(event);
        emit(res);
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
