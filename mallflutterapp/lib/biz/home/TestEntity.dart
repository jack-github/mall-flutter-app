class TestEntity {
  String city;
  String cityCode;
  String mobileNumber;
  String operator;
  String province;
  String zipCode;

  TestEntity({this.city, this.cityCode, this.mobileNumber, this.operator, this.province, this.zipCode});

  TestEntity.fromJson(Map<String, dynamic> json) {    
    this.city = json['city'];
    this.cityCode = json['cityCode'];
    this.mobileNumber = json['mobileNumber'];
    this.operator = json['operator'];
    this.province = json['province'];
    this.zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['cityCode'] = this.cityCode;
    data['mobileNumber'] = this.mobileNumber;
    data['operator'] = this.operator;
    data['province'] = this.province;
    data['zipCode'] = this.zipCode;
    return data;
  }

}
