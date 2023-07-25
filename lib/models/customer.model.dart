class Customer {
  String? name;
  String? email;
  String? phone;

  Customer({this.email, this.name, this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
}
