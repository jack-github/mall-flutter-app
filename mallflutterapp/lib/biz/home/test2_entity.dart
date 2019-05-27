class Test2Entity {
	String date;
	String dressingIndex;
	String city;
	String coldIndex;
	String updateTime;
	String distrct;
	String exerciseIndex;
	String airCondition;

	Test2Entity({this.date, this.dressingIndex, this.city, this.coldIndex, this.updateTime, this.distrct, this.exerciseIndex, this.airCondition});

	Test2Entity.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		dressingIndex = json['dressingIndex'];
		city = json['city'];
		coldIndex = json['coldIndex'];
		updateTime = json['updateTime'];
		distrct = json['distrct'];
		exerciseIndex = json['exerciseIndex'];
		airCondition = json['airCondition'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['dressingIndex'] = this.dressingIndex;
		data['city'] = this.city;
		data['coldIndex'] = this.coldIndex;
		data['updateTime'] = this.updateTime;
		data['distrct'] = this.distrct;
		data['exerciseIndex'] = this.exerciseIndex;
		data['airCondition'] = this.airCondition;
		return data;
	}
}
