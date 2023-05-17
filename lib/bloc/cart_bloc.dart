
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/fetch/model.dart';

Future<List<CartProductModel>> getCartProducts() async {
  List<CartProductModel> cartProd = [];
  final dio = Dio();
  try {
    var resCart = (await dio.get('https://fakestoreapi.com/carts/1')).data;
    var resProducts =
        (await dio.get("https://fakestoreapi.com/products/")).data;

    for (int i = 0; i < resProducts.length; i++) {
      for (int k = 0; k < resCart['products'].length; k++) {
        if (resProducts[i]['id'] == resCart['products'][k]['productId']) {
          cartProd.add(CartProductModel(
              quantity: resCart['products'][k]['quantity'],
              id: resProducts[i]['id'],
              title: resProducts[i]['title'],
              description: resProducts[i]['description'],
              category: resProducts[i]['category'],
              image: resProducts[i]['image'],
              price: resProducts[i]['price'].toDouble(),
              rating: resProducts[i]['rating']['rate']));
        }
      }
    }
  } catch (e) {
    // throw Exception(e);
    return [];
  }
  return cartProd;
}

class CartBloc extends Bloc<int, List<CartProductModel>> {
  // final String id;
  CartBloc() : super([]) {
    // @override
    on<int>(((event, emit) async {
      try {
        var res = await getCartProducts();
        emit(res);
      } catch (e) {
        emit([]);
      }
    }));
  }

}
