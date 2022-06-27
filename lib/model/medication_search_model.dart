
import 'package:flutter/gestures.dart';

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
  int? price;
  String? mobile1;
  String? photo;

  Pharmacys(
      {this.mypharmacyId, this.name, this.quntity, this.price, this.mobile1,this.photo});

  Pharmacys.fromJson(Map<String, dynamic> json) {
    mypharmacyId = json['mypharmacy_id'];
    name = json['name'];
    quntity = json['quntity'];
    price = json['price'];
    mobile1 = json['mobile1'];
    photo=json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mypharmacy_id'] = this.mypharmacyId;
    data['name'] = this.name;
    data['quntity'] = this.quntity;
    data['price'] = this.price;
    data['mobile1'] = this.mobile1;
    data['photo']=this.photo;
    return data;
  }
}