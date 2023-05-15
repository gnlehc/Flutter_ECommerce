import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingassignment/fetch/model.dart';

class CartBloc extends Bloc<String, CartModel> {
  CartBloc() : super(CartModel(id: 1, userId: 1, date: " ", products: []));
}
