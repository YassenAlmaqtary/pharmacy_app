class PharmacyModel {
  int? id;
  String? name;
  String? address;
  String? mobile1;
  String? mobile2;
  String? socialMedia;
  String? photo;
  String? pdfPath;
  int? statuse;
  String? updatedAt;
  String? adderssDetails;

  PharmacyModel(
      {this.id,
        this.name,
        this.address,
        this.mobile1,
        this.mobile2,
        this.socialMedia,
        this.photo,
        this.pdfPath,
        this.statuse,
        this.updatedAt,
        this.adderssDetails});

  PharmacyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    socialMedia = json['social_media'];
    photo = json['photo'];
    pdfPath = json['pdf_path'];
    statuse = json['statuse'];
    updatedAt = json['updated_at'];
    adderssDetails = json['adderss_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['social_media'] = this.socialMedia;
    data['photo'] = this.photo;
    data['pdf_path'] = this.pdfPath;
    data['statuse'] = this.statuse;
    data['updated_at'] = this.updatedAt;
    data['adderss_details'] = this.adderssDetails;
    return data;
  }
}


