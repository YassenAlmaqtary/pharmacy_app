class CategoryWitheMedicationModel{
  int? id;
  String? name;
  List<Medications>? medications;

  CategoryWitheMedicationModel({this.id, this.name, this.medications});

  CategoryWitheMedicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['medications'] != null) {
      medications = <Medications>[];
      json['medications'].forEach((v) {
        medications!.add(new Medications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medications {
  int? id;
  String? tradeName;
  String? photo;

  Medications({this.id, this.tradeName, this.photo});

  Medications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeName = json['trade_name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trade_name'] = this.tradeName;
    data['photo'] = this.photo;
    return data;
  }
}