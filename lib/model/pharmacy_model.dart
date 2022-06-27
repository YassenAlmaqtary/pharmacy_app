
class PharmacyModel {
  int? id;
  int? quntity;
  String? name;
  String? mobile;
  String? photo;
  int? price;

  PharmacyModel({this.id, this.quntity, this.name, this.mobile, this.photo,this.price});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quntity = json['quntity'];
    name = json['name'];
    mobile = json['mobile'];
    photo = json['photo'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quntity'] = this.quntity;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['photo'] = this.photo;
    data['price'] = this.price;
    return data;
  }
}