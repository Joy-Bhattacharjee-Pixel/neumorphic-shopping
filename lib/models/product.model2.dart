class ProductModel2 {
  String? name;
  String? image;
  double? price;
  double? discount;
  double? rating;
  List<String>? size;

  ProductModel2(
      {this.discount,
      this.image,
      this.name,
      this.price,
      this.rating,
      this.size});

  ProductModel2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = (json['price']).toDouble();
    discount = (json['discount']).toDouble();
    rating = (json['rating']).toDouble();
    size = json['size'];
  }
}
