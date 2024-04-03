import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/bloc/category/category_event.dart';
import 'package:trainingassignment/bloc/category/category_state.dart';
import 'package:trainingassignment/fetch/product.dart';

class CategoryBloc extends Bloc<CategoryPageEvent, CategoryPageState> {
  CategoryBloc() : super(const CategoryInitialState()) {
    on<FetchCategoryList>((event, emit) async {
      try {
        emit(CategoryLoadingState());
        var res = await getCategories();
        if (res.isNotEmpty) {
          emit(CategoryHasData(res, res.first));
        } else {
          emit(const CategoryErrorState("No categories found"));
        }
      } on DioError catch (e) {
        emit(CategoryErrorState(e.response.toString()));
      }
    });
  }
}

class CategoryProdBloc
    extends Bloc<CategoryProdPageEvent, CategoryProdPageState> {
  CategoryProdBloc() : super(const CategoryProdInitialState()) {
    on<FetchCategoryProductList>((event, emit) async {
      var res = await getCategoryProd(event.category);
      emit(CategoryProdHasData(res));
    });
  }
}
