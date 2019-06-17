import 'package:mallflutterapp/net/BaseResponseEntity2.dart';

class CategoryInfoListRespEntity extends BaseResponseEntity2{
	int total;
	int curPage;
	List<CategoryInfoListRespEntityList> xList;

	CategoryInfoListRespEntity({this.total, this.curPage, this.xList});

	CategoryInfoListRespEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		curPage = json['curPage'];
		if (json['list'] != null) {
			xList = new List<CategoryInfoListRespEntityList>();(json['list'] as List).forEach((v) { xList.add(new CategoryInfoListRespEntityList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = super.toJson();
		data['total'] = this.total;
		data['curPage'] = this.curPage;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class CategoryInfoListRespEntityList {
	String sourceUrl;
	String subTitle;
	String pubTime;
	String id;
	String title;
	String thumbnails;
	String cid;

	CategoryInfoListRespEntityList({this.sourceUrl, this.subTitle, this.pubTime, this.id, this.title, this.thumbnails, this.cid});

	CategoryInfoListRespEntityList.fromJson(Map<String, dynamic> json) {
		sourceUrl = json['sourceUrl'];
		subTitle = json['subTitle'];
		pubTime = json['pubTime'];
		id = json['id'];
		title = json['title'];
		thumbnails = json['thumbnails'];
		cid = json['cid'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sourceUrl'] = this.sourceUrl;
		data['subTitle'] = this.subTitle;
		data['pubTime'] = this.pubTime;
		data['id'] = this.id;
		data['title'] = this.title;
		data['thumbnails'] = this.thumbnails;
		data['cid'] = this.cid;
		return data;
	}
}
