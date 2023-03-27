import 'package:yatrigan/src/model/main/product/product_list_model.dart';

class IrShopInvListModel {
  final String _id;
  final String _shop;
  final ProductListModel _product;

  String get getId => _id;
  String get getShop => _shop;
  ProductListModel get getProduct => _product;

  IrShopInvListModel(
    this._id,
    this._shop,
    this._product,
  );

  factory IrShopInvListModel.fromJson(Map<String, dynamic> json) {
    ProductListModel product = ProductListModel.fromJson(json['product']);
    return IrShopInvListModel(
      json["id"] as String,
      json["shop"] as String,
      product,
    );
  }
}
