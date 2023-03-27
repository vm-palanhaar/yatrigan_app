import 'product_details_images_model.dart';

class ProductDetailsModel {
  String _id;
  String _brand;
  String _name;
  String _image;
  List<ProductDetailsImagesModel> _images;
  String _desc;
  String _price;
  String _cat;

  String get getId => _id;
  String get getBrand => _brand;
  String get getName => _name;
  String get getImage => _image;
  List<ProductDetailsImagesModel> get getImages => _images;
  String get getDesc => _desc;
  String get getPrice => _price;
  String get getCat => _cat;

  ProductDetailsModel(
    this._id,
    this._brand,
    this._name,
    this._image,
    this._images,
    this._desc,
    this._price,
    this._cat,
  );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    var list = json['images'] as List;
    List<ProductDetailsImagesModel> prodImages = [];
    if (list.isNotEmpty) {
      prodImages = list
          .map<ProductDetailsImagesModel>(
              (json) => ProductDetailsImagesModel.fromJson(json))
          .toList();
    }
    return ProductDetailsModel(
      json["id"] as String,
      json["brand"] ?? '',
      json["name"] as String,
      json["image"] as String,
      prodImages,
      json["description"] ?? '',
      json["price"] as String,
      json["category"],
    );
  }
}
