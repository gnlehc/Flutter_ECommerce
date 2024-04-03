import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trainingassignment/bloc/products/product_bloc.dart';
import 'package:trainingassignment/bloc/products/product_event.dart';
import 'package:trainingassignment/bloc/products/product_state.dart';
import 'package:trainingassignment/model/product_model.dart';
import 'package:trainingassignment/service/product_service.dart';
import 'package:bloc_test/bloc_test.dart';

class MockProductService extends Mock implements ProductService {}

void main() {
  productBlocTest();
}

void productBlocTest() {
  late MockProductService mockProductService;
  late ProductBloc productBloc;
  late ListProductModel mockResultSuccess;

  setUp(() async {
    mockProductService = MockProductService();
    productBloc = ProductBloc(productService: mockProductService);
  });

  group("get all product data", () {
    setUp(() {
      mockResultSuccess = ListProductModel(data: [
        MsProduct(
          id: 1,
          title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          description:
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          price: 109.95,
          rating: [3.9, 120],
        ),
      ]);
    });

    blocTest<ProductBloc, ProductState>(
      "emit success state",
      build: () {
        when(() => mockProductService.getProduct())
            .thenAnswer((_) async => mockResultSuccess);
        return productBloc;
      },
      act: (bloc) => bloc.add(const FetchListProductData()),
      expect: () => [ProductLoadingState(), isA<ProductSuccessState>()],
    );
  });
}
