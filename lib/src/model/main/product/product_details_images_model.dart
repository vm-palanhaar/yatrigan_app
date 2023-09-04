class ProductDetailsImagesModel {
  int id;
  String image;

  ProductDetailsImagesModel({
    required this.id,
    required this.image,
  });

  factory ProductDetailsImagesModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsImagesModel(
      id: json["id"] as int,
      image: json["image"] as String,
    );
  }
}
