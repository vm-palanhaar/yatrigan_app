import 'package:flutter/material.dart';
import 'package:yatrigan/src/model/main/product/product_details_model.dart';

class PcCtrlModel extends ChangeNotifier{
  String errorMsg = '';

  //getProductDetailsApi
  ProductDetailsModel? product;
  List<String> productImage = [];
}
