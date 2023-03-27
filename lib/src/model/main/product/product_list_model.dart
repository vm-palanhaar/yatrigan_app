class ProductListModel {
  String _id;
  String _brand;
  String _name;
  String _image;
  String _price;
  String _category;

  String get getId => _id;
  String get getBrand => _brand;
  String get getName => _name;
  String get getImage => _image;
  String get getPrice => _price;
  String get getCategory => _category;

  ProductListModel(
    this._id,
    this._brand,
    this._name,
    this._image,
    this._price,
    this._category,
  );

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      json["id"] as String,
      json["brand"] ?? '',
      json["name"] as String,
      json["image"] as String,
      json["price"] as String,
      json["category"] as String,
    );
  }
}
