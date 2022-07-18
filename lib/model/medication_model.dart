//
// import 'package:pharmacy/model/pharmacy_detail_model.dart';
//
// class MedicationModel {
// int? id;
// String? tradeName;
// String? scientificName;
// String? madeIn;
// int? active;
// String? updatedAt;
// String? photo;
// List<Pharmacys>? pharmacys;
//
// MedicationModel(
//     {this.id,
//       this.tradeName,
//       this.scientificName,
//       this.madeIn,
//       this.active,
//       this.updatedAt,
//       this.photo,
//       this.pharmacys});
//
// MedicationModel.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// tradeName = json['trade_name'];
// scientificName = json['scientific_name'];
// madeIn = json['made_in'];
// active = json['active'];
// updatedAt = json['updated_at'];
// photo = json['photo'];
// if (json['pharmacys'] != null) {
// pharmacys = <Pharmacys>[];
// json['pharmacys'].forEach((v) {
// pharmacys!.add(new Pharmacys.fromJson(v));
// });
// }
// }
//
// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['id'] = this.id;
//   data['trade_name'] = this.tradeName;
//   data['scientific_name'] = this.scientificName;
//   data['made_in'] = this.madeIn;
//   data['active'] = this.active;
//   data['updated_at'] = this.updatedAt;
//   data['photo'] = this.photo;
//   if (this.pharmacys != null) {
//     data['pharmacys'] = this.pharmacys!.map((v) => v.toJson()).toList();
//   }
//   return data;
// }
// }