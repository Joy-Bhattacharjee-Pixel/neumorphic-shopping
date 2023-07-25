class CategoryModel {
  int? id;
  String? name;
  String? image;

  CategoryModel({this.id, this.name, this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    image = getImagePath(name: json["name"]);
  }

  String getImagePath({name}) {
    String base = "assets/";
    switch (name) {
      case "Men":
        return base + "man_1864509.png";
      case "Women":
        return base + "woman_949644.png";
      case "Kids":
        return base + "children_3886660.png";
      case "Footwear":
        return base + "shoes_2742687.png";
      case "Fitness":
        return base + "sports_3311579.png";
      case "Accessories":
        return base + "leather-work_5531535.png";
      default:
    }
    return "";
  }
}
