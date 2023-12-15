import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assesment/app/data/models/order_book_model/order_book_model.dart';

class OrderBookController extends GetxController {
  final buyersOrders = <OrderBookModel>[].obs;
  final sellersOrders = <OrderBookModel>[].obs;


  ScrollController bListController = ScrollController();
  ScrollController sListController = ScrollController();
}