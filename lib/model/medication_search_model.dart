class MedicationSearchModel {
  String? tradeName;
  int? id;
  List<Pharmacys>? pharmacys;

  MedicationSearchModel({this.tradeName, this.id, this.pharmacys});

  MedicationSearchModel.fromJson(Map<String, dynamic> json) {
    tradeName = json['trade_name'];
    id = json['id'];
    if (json['pharmacys'] != null) {
      pharmacys = <Pharmacys>[];
      json['pharmacys'].forEach((v) {
        pharmacys!.add(new Pharmacys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trade_name'] = this.tradeName;
    data['id'] = this.id;
    if (this.pharmacys != null) {
      data['pharmacys'] = this.pharmacys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pharmacys {
  int? mypharmacyId;
  String? name;
  int? quntity;
  String? address;
  String? adderss_details;
  String? socialMedia;
  int? price;
  String? mobile1;
  String? mobile2;
  String? productionDate;
  String? expiryDate;
  String? photo;

  Pharmacys(
      {this.mypharmacyId,
        this.name,
        this.quntity,
        this.address,
        this.socialMedia,
        this.price,
        this.mobile1,
        this.mobile2,
        this.productionDate,
        this.expiryDate,
        this.photo,
        this.adderss_details,
      });

  Pharmacys.fromJson(Map<String, dynamic> json) {
    mypharmacyId = json['mypharmacy_id'];
    name = json['name'];
    quntity = json['quntity'];
    address = json['address'];
    adderss_details=json['adderss_details'];
    socialMedia = json['social_media'];
    price = json['price'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    productionDate = json['production_date'];
    expiryDate = json['expiry_date'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mypharmacy_id'] = this.mypharmacyId;
    data['name'] = this.name;
    data['quntity'] = this.quntity;
    data['address'] = this.address;
    data['adderss_details']=this.adderss_details;
    data['social_media'] = this.socialMedia;
    data['price'] = this.price;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['production_date'] = this.productionDate;
    data['expiry_date'] = this.expiryDate;
    data['photo'] = this.photo;
    return data;
  }
}