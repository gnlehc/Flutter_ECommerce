import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/fetch/product.dart';
import '../fetch/model.dart';

class CategoryBloc extends Bloc<String, CategoryModel> {
  CategoryBloc()
      : super(CategoryModel(
            categories: [], retcode: 0, category: "electronics")) {
    on<String>((event, emit) async {
      var temp = CategoryModel(
          retcode: state.retcode,
          categories: state.categories,
          category: state.category);
      if (event == "get") {
        // var temp = CategoryModel(categories: [], category: "");
        try {
          var res = await getCategories();
          temp.categories = res;
          temp.retcode = 200;
        } catch (e) {
          temp.retcode = 500;
        } finally {
          emit(temp);
        }
      } else {
        temp.category = event;
        emit(temp);
      }
    });
  }
}

class CategoryProdBloc extends Bloc<String, List<Products>> {
  CategoryProdBloc() : super([]) {
    on<String>((event, emit) async {
      // if (event != "get") {
      //   var res = await getCategoryProd('electronics');
      // }
      // print("event: $event");
      var res = await getCategoryProd(event);
      // print("res : ${res.map((e) => e.title)}");
      // List<String> titles = res.map((prod) => prod.title).toList();
      emit(res);
    });
  }
}
