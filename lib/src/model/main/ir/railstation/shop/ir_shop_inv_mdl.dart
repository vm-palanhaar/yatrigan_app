import 'package:yatrigan/src/model/main/ir/railstation/shop/shop_inv_mdl.dart';

class IrShopInvMdl {
  final String shopId;
  final String stationCode;
  final List<ShopInvMdl> inv;
  final String error;

  IrShopInvMdl(
      {required this.shopId,
      required this.stationCode,
      required this.inv,
      required this.error});

  factory IrShopInvMdl.success(Map<String, dynamic> json) {
    var invData = json['inv'] as List;
    List<ShopInvMdl> list =
        invData.map<ShopInvMdl>((json) => ShopInvMdl.fromJson(json)).toList();
    return IrShopInvMdl(
      shopId: json["shop"] as String,
      stationCode: json["station"] as String,
      inv: list,
      error: "",
    );
  }

  factory IrShopInvMdl.fail(Map<String, dynamic> json) {
    return IrShopInvMdl(
      shopId: json["shop"] as String,
      stationCode: json["station"] as String,
      inv: [],
      error: json["error"] as String,
    );
  }
}
