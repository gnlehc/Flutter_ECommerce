import 'package:trainingassignment/model/product_model.dart';

abstract class CategoryPageState {
  const CategoryPageState();

  List<Object> get props => [];
  get temp => null;
}

abstract class CategoryProdPageState {
  const CategoryProdPageState();
  List<Object> get props => [];
  get temp => null;
}

// CATEGORY PAGE
class CategoryInitialState extends CategoryPageState {
  const CategoryInitialState() : super();
  @override
  List<Object> get props => [];
}

class CategoryHasData extends CategoryPageState {
  final List<String> categories;
  final String category;
  // final String selectedCategory;
  const CategoryHasData(this.categories, this.category);
  @override
  List<Object> get props => [categories, category];
}

class CategoryLoadingState extends CategoryPageState {}

class CategoryErrorState extends CategoryPageState {
  final String errMessage;

  const CategoryErrorState(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}

// CATEGORY PRODUCT PAGE
class CategoryProdInitialState extends CategoryProdPageState {
  const CategoryProdInitialState() : super();
  @override
  List<Object> get props => [];
}

class CategoryProdHasData extends CategoryProdPageState {
  final List<MsProduct> data;
  // final String selectedCategory;
  const CategoryProdHasData(this.data);
  @override
  List<Object> get props => [data];
}

class CategoryProdLoadingState extends CategoryProdPageState {}

class CategoryProdErrorState extends CategoryProdPageState {
  final String errMessage;

  const CategoryProdErrorState(this.errMessage);

  @override
  List<Object> get props => [errMessage];
}
