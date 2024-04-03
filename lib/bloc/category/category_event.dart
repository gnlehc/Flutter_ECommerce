abstract class CategoryPageEvent {
  const CategoryPageEvent();
}

abstract class CategoryProdPageEvent {
  const CategoryProdPageEvent();
}

class FetchCategoryList extends CategoryPageEvent {
  List<String>? categories;
  List<Object?> get props => [categories];
}

class FetchCategoryProductList extends CategoryProdPageEvent {
  late String category;
  List<Object?> get props => [category];
}
