

class MedicationDetailModel {
  int? id;
  int? quntity;
  String? name;
  String? scientificName;
  String? photo;
  int? price;
  String? productionDate;
  String? expiryDate;

  MedicationDetailModel(
      {this.id,
        this.quntity,
        this.name,
        this.scientificName,
        this.photo,
        this.price,
        this.productionDate,
        this.expiryDate});

  MedicationDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quntity = json['quntity'];
    name = json['name'];
    scientificName = json['scientific_name'];
    photo = json['photo'];
    price = json['price'];
    productionDate = json['production_date'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quntity'] = this.quntity;
    data['name'] = this.name;
    data['scientific_name'] = this.scientificName;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['production_date'] = this.productionDate;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}