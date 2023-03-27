class IrShopListModel {
  final String id;
  final String name;
  final String image;
  final String station;
  final String platformA;
  final String platformB;

  IrShopListModel({
    required this.id,
    required this.name,
    required this.image,
    required this.station,
    required this.platformA,
    required this.platformB,
  });

  factory IrShopListModel.fromJson(Map<String, dynamic> json) {
    return IrShopListModel(
      id: json["id"] as String,
      name: json["name"] as String,
      image: json["image"] as String,
      station: json["station"] as String,
      platformA: json["platform_a"] ?? '',
      platformB: json["platform_b"] ?? '',
    );
  }
}
