class IrShopInfoMdl {
  final String id;
  final String name;
  final String image;
  final String contactNo;
  final String station;
  final String pltA;
  final String pltB;
  final int isCash;
  final int isUpi;
  final int isCard;

  bool get getIsCash => isCash == 1 ? true : false;
  bool get getIsUpi => isUpi == 1 ? true : false;
  bool get getIsCard => isCard == 1 ? true : false;

  IrShopInfoMdl(
    this.id,
    this.name,
    this.image,
    this.contactNo,
    this.station,
    this.pltA,
    this.pltB,
    this.isCash,
    this.isUpi,
    this.isCard,
  );

  factory IrShopInfoMdl.fromJson(Map<String, dynamic> json) {
    return IrShopInfoMdl(
      json["id"] as String,
      json["name"] as String,
      json["image"] as String,
      json["contact_number"] as String,
      json["station"] as String,
      json["platform_a"] ?? '',
      json["platform_b"] ?? '',
      json["is_cash"] as bool ? 1 : 0,
      json["is_upi"] as bool ? 1 : 0,
      json["is_card"] as bool ? 1 : 0,
    );
  }
}
