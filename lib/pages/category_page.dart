// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trainingassignment/bloc/category/category_event.dart';
// import 'package:trainingassignment/bloc/category/category_state.dart';
// import 'package:trainingassignment/navbar.dart';
// import '../bloc/category/category_bloc.dart';
// import '../home_page/product_cart.dart';
// import '../bloc/account/login_event.dart';

// class CategoryProduct extends StatelessWidget {
//   final String category;
//   CategoryProduct({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CategoryProdBloc(),
//       child: BlocBuilder<CategoryProdBloc, CategoryProdPageState>(
//         builder: (context, state) {
//           BlocProvider.of<CategoryProdBloc>(context)
//               .add(FetchCategoryProductList());
//           if (state is CategoryProdLoadingState) {
//             return LoadingIndicator();
//           } else {
//             return GridView.builder(
//               shrinkWrap: true,
//               itemCount: state.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 5,
//                 crossAxisSpacing: 10.0,
//                 mainAxisSpacing: 10.0,
//               ),
//               itemBuilder: (context, index) {
//                 final products = state[index];
//                 return ProductCard(
//                   product: products,
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// class LoadingIndicator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }
// }

// class Categories extends StatefulWidget {
//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   String activeCategory = '';
//   late String username = '';

//   @override
//   Widget build(BuildContext context) {
//     final args = ModalRoute.of(context)!.settings.arguments == null
//         ? ScreenArguments(username: username)
//         : ModalRoute.of(context)!.settings.arguments as ScreenArguments;

//     if (args.username.isNotEmpty) username = args.username;

//     return BlocProvider(
//       create: (context) => CategoryBloc()..add(FetchCategoryList()),
//       child: BlocBuilder<CategoryBloc, CategoryPageState>(
//         builder: (context, state) {
//           if (state is CategoryHasData) {
//             return Scaffold(
//               backgroundColor: const Color(0xf1f1f1f1),
//               appBar: PreferredSize(
//                 preferredSize: const Size(100, 50),
//                 child: Navbar(
//                   username: username,
//                 ),
//               ),
//               body: SingleChildScrollView(
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         const SizedBox(height: 40),
//                         Container(
//                           padding: const EdgeInsets.symmetric(vertical: 50),
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(4),
//                               topRight: Radius.circular(4),
//                             ),
//                             color: Color(0xFF2F6799),
//                           ),
//                           alignment: Alignment.topCenter,
//                           child: const Text(
//                             "Category",
//                             style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Center(
//                           child: Wrap(
//                             spacing: 10,
//                             runSpacing: 10,
//                             children: state.categories
//                                 .map(
//                                   (e) => ElevatedButton(
//                                     style: ButtonStyle(
//                                       padding: MaterialStateProperty
//                                           .resolveWith<EdgeInsetsGeometry?>(
//                                         (states) => const EdgeInsets.only(
//                                           top: 30,
//                                           bottom: 30,
//                                           left: 40,
//                                           right: 40,
//                                         ),
//                                       ),
//                                       backgroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                         activeCategory == e
//                                             ? const Color(0xfff18700)
//                                             : Colors.white,
//                                       ),
//                                     ),
//                                     onPressed: () {
//                                       setState(() {
//                                         activeCategory = e;
//                                       });
//                                       BlocProvider.of<CategoryBloc>(context)
//                                           .add(e as CategoryPageEvent);
//                                     },
//                                     child: Text(
//                                       e,
//                                       style: TextStyle(
//                                         fontSize: 20,
//                                         color: activeCategory == e
//                                             ? Colors.white
//                                             : Colors.black,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                                 .toList(),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         // isLoading
//                         //     ? LoadingIndicator()
//                         //     :
//                         // CategoryProduct(category: state.category),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return const Text("Error bro");
//           }
//         },
//       ),
//     );
//   }
// }
