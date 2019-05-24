class BaseRequestEntity {
  String key="26864c7ba4dd5";

  BaseRequestEntity({this.key});

  BaseRequestEntity.fromJson(Map<String, dynamic> json) {    
    this.key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    return data;
  }
}
