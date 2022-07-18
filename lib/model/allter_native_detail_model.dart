class AllterNativeDetailModel {
  int? id;
  String? tradeName;
  String? scientificName;
  String? madeIn;
  String? photo;
  int? price;
  int? quntity;
  String? productionDate;
  String? expiryDate;

  AllterNativeDetailModel(
      {this.id,
        this.tradeName,
        this.scientificName,
        this.madeIn,
        this.photo,
        this.price,
        this.quntity,
        this.productionDate,
        this.expiryDate});

  AllterNativeDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeName = json['trade_name'];
    scientificName = json['scientific_name'];
    madeIn = json['made_in'];
    photo = json['photo'];
    price = json['price'];
    quntity = json['quntity'];
    productionDate = json['production_date'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trade_name'] = this.tradeName;
    data['scientific_name'] = this.scientificName;
    data['made_in'] = this.madeIn;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['quntity'] = this.quntity;
    data['production_date'] = this.productionDate;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}