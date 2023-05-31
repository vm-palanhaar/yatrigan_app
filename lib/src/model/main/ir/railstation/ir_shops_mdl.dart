class IrShopsMdl {
  final String station;
  final List<IrShopMdl> shops;
  final String error;

  IrShopsMdl({
    required this.station,
    required this.shops,
    required this.error,
  });

  factory IrShopsMdl.success(Map<String, dynamic> json) {
    var invData = json['shops'] as List;
    List<IrShopMdl> list =
        invData.map<IrShopMdl>((json) => IrShopMdl.fromJson(json)).toList();
    return IrShopsMdl(
      station: json["station"] as String,
      shops: list,
      error: '',
    );
  }

  factory IrShopsMdl.fail(Map<String, dynamic> json) {
    List<String> list = List<String>.from(json['error'] as List);
    return IrShopsMdl(
      station: json["station"] as String,
      shops: [],
      error: list.toString(),
    );
  }
}

class IrShopMdl {
  final String id;
  final String name;
  final String image;
  final String platformA;
  final String platformB;

  IrShopMdl({
    required this.id,
    required this.name,
    required this.image,
    required this.platformA,
    required this.platformB,
  });

  factory IrShopMdl.fromJson(Map<String, dynamic> json) {
    return IrShopMdl(
      id: json["id"] as String,
      name: json["name"] as String,
      image: json["image"] as String,
      platformA: json["platform_a"] ?? '',
      platformB: json["platform_b"] ?? '',
    );
  }
}
