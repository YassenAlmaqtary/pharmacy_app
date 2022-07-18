class PharmacyDetailModel {
  int? id;
  int? quntity;
  String? name;
  String? mobile;
  String? phone;
  String? address;
  String? adderssDetails;
  String? photo;
  int? price;
  String? productionDate;
  String? expiryDate;

  PharmacyDetailModel(
      {
        this.id,
        this.quntity=0,
        this.name,
        this.mobile,
        this.phone,
        this.address,
        this.adderssDetails,
        this.photo,
        this.price=0,
        this.productionDate='',
        this.expiryDate=''
      });

  PharmacyDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quntity = json['quntity'];
    name = json['name'];
    mobile = json['mobile'];
    phone = json['phone'];
    address = json['address'];
    adderssDetails = json['adderss_details'];
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
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['adderss_details'] = this.adderssDetails;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['production_date'] = this.productionDate;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}