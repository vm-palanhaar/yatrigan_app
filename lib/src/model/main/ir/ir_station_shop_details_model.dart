class IrStationShopDetailsModel {
  final String _id;
  final String _name;
  final String _image;
  final String _contactNo;
  final String _station;
  final String _pltA;
  final String _pltB;
  final int _isCash;
  final int _isUpi;
  final int _isCard;

  String get getId => _id;
  String get getName => _name;
  String get getImage => _image;
  String get getContactNo => _contactNo;
  String get getStation => _station;
  String get getPltA => _pltA;
  String get getPltB => _pltB;
  bool get getIsCash => _isCash == 1 ? true : false;
  bool get getIsUpi => _isUpi == 1 ? true : false;
  bool get getIsCard => _isCard == 1 ? true : false;

  IrStationShopDetailsModel(
    this._id,
    this._name,
    this._image,
    this._contactNo,
    this._station,
    this._pltA,
    this._pltB,
    this._isCash,
    this._isUpi,
    this._isCard,
  );

  factory IrStationShopDetailsModel.fromJson(Map<String, dynamic> json) {
    return IrStationShopDetailsModel(
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
