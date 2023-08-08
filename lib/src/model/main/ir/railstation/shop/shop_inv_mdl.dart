import 'package:yatrigan/src/model/main/product/product_list_model.dart';

class ShopInvMdl {
  final String id;
  final ProductListModel prod;

  ShopInvMdl({
    required this.id,
    required this.prod,
  });

  factory ShopInvMdl.fromJson(Map<String, dynamic> json) {
    ProductListModel product = ProductListModel.fromJson(json['product']);
    return ShopInvMdl(
      id: json["id"] as String,
      prod: product,
    );
  }
}
