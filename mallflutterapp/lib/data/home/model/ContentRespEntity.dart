import 'package:mallflutterapp/net/BaseResponseEntity.dart';

/// 首页响应数据
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/17
class ContentRespEntity extends BaseResponseEntity {
  List<ContentRespDataNewproductlist> newProductList;
  List<ContentRespDataSubjectlist> subjectList;
  ContentRespDataHomeflashpromotion homeFlashPromotion;
  List<ContentRespDataHotproductlist> hotProductList;
  List<ContentRespDataBrandlist> brandList;
  List<ContentRespDataAdvertiselist> advertiseList;

  ContentRespEntity(
      {this.newProductList,
      this.subjectList,
      this.homeFlashPromotion,
      this.hotProductList,
      this.brandList,
      this.advertiseList});

  ContentRespEntity.fromJson(Map<String, dynamic> json) {
    if (json['newProductList'] != null) {
      newProductList = new List<ContentRespDataNewproductlist>();
      (json['newProductList'] as List).forEach((v) {
        newProductList.add(new ContentRespDataNewproductlist.fromJson(v));
      });
    }
    if (json['subjectList'] != null) {
      subjectList = new List<ContentRespDataSubjectlist>();
      (json['subjectList'] as List).forEach((v) {
        subjectList.add(new ContentRespDataSubjectlist.fromJson(v));
      });
    }
    homeFlashPromotion = json['homeFlashPromotion'] != null
        ? new ContentRespDataHomeflashpromotion.fromJson(
            json['homeFlashPromotion'])
        : null;
    if (json['hotProductList'] != null) {
      hotProductList = new List<ContentRespDataHotproductlist>();
      (json['hotProductList'] as List).forEach((v) {
        hotProductList.add(new ContentRespDataHotproductlist.fromJson(v));
      });
    }
    if (json['brandList'] != null) {
      brandList = new List<ContentRespDataBrandlist>();
      (json['brandList'] as List).forEach((v) {
        brandList.add(new ContentRespDataBrandlist.fromJson(v));
      });
    }
    if (json['advertiseList'] != null) {
      advertiseList = new List<ContentRespDataAdvertiselist>();
      (json['advertiseList'] as List).forEach((v) {
        advertiseList.add(new ContentRespDataAdvertiselist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map();
    if (this.newProductList != null) {
      data['newProductList'] =
          this.newProductList.map((v) => v.toJson()).toList();
    }
    if (this.subjectList != null) {
      data['subjectList'] = this.subjectList.map((v) => v.toJson()).toList();
    }
    if (this.homeFlashPromotion != null) {
      data['homeFlashPromotion'] = this.homeFlashPromotion.toJson();
    }
    if (this.hotProductList != null) {
      data['hotProductList'] =
          this.hotProductList.map((v) => v.toJson()).toList();
    }
    if (this.brandList != null) {
      data['brandList'] = this.brandList.map((v) => v.toJson()).toList();
    }
    if (this.advertiseList != null) {
      data['advertiseList'] =
          this.advertiseList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentRespDataNewproductlist {
  String note;
  int newStatus;
  double originalPrice;
  String keywords;
  String productCategoryName;
  int feightTemplateId;
  int lowStock;
  String description;
  String pic;
  int productCategoryId;
  int recommandStatus;
  int verifyStatus;
  String subTitle;
  int deleteStatus;
  double price;
  int usePointLimit;
  int id;
  int giftGrowth;
  int stock;
  int publishStatus;
  int promotionType;
  String brandName;
  String productSn;
  String albumPics;
  int productAttributeCategoryId;
  double weight;
  String detailTitle;
  int sort;
  int giftPoint;
  int promotionPerLimit;
  int sale;
  String unit;
  String serviceIds;
  int brandId;
  String name;
  int previewStatus;

  ContentRespDataNewproductlist(
      {this.note,
      this.newStatus,
      this.originalPrice,
      this.keywords,
      this.productCategoryName,
      this.feightTemplateId,
      this.lowStock,
      this.description,
      this.pic,
      this.productCategoryId,
      this.recommandStatus,
      this.verifyStatus,
      this.subTitle,
      this.deleteStatus,
      this.price,
      this.usePointLimit,
      this.id,
      this.giftGrowth,
      this.stock,
      this.publishStatus,
      this.promotionType,
      this.brandName,
      this.productSn,
      this.albumPics,
      this.productAttributeCategoryId,
      this.weight,
      this.detailTitle,
      this.sort,
      this.giftPoint,
      this.promotionPerLimit,
      this.sale,
      this.unit,
      this.serviceIds,
      this.brandId,
      this.name,
      this.previewStatus});

  ContentRespDataNewproductlist.fromJson(Map<String, dynamic> json) {
    note = json['note'];
    newStatus = json['newStatus'];
    originalPrice = json['originalPrice'];
    keywords = json['keywords'];
    productCategoryName = json['productCategoryName'];
    feightTemplateId = json['feightTemplateId'];
    lowStock = json['lowStock'];
    description = json['description'];
    pic = json['pic'];
    productCategoryId = json['productCategoryId'];
    recommandStatus = json['recommandStatus'];
    verifyStatus = json['verifyStatus'];
    subTitle = json['subTitle'];
    deleteStatus = json['deleteStatus'];
    price = json['price'];
    usePointLimit = json['usePointLimit'];
    id = json['id'];
    giftGrowth = json['giftGrowth'];
    stock = json['stock'];
    publishStatus = json['publishStatus'];
    promotionType = json['promotionType'];
    brandName = json['brandName'];
    productSn = json['productSn'];
    albumPics = json['albumPics'];
    productAttributeCategoryId = json['productAttributeCategoryId'];
    weight = json['weight'];
    detailTitle = json['detailTitle'];
    sort = json['sort'];
    giftPoint = json['giftPoint'];
    promotionPerLimit = json['promotionPerLimit'];
    sale = json['sale'];
    unit = json['unit'];
    serviceIds = json['serviceIds'];
    brandId = json['brandId'];
    name = json['name'];
    previewStatus = json['previewStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note'] = this.note;
    data['newStatus'] = this.newStatus;
    data['originalPrice'] = this.originalPrice;
    data['keywords'] = this.keywords;
    data['productCategoryName'] = this.productCategoryName;
    data['feightTemplateId'] = this.feightTemplateId;
    data['lowStock'] = this.lowStock;
    data['description'] = this.description;
    data['pic'] = this.pic;
    data['productCategoryId'] = this.productCategoryId;
    data['recommandStatus'] = this.recommandStatus;
    data['verifyStatus'] = this.verifyStatus;
    data['subTitle'] = this.subTitle;
    data['deleteStatus'] = this.deleteStatus;
    data['price'] = this.price;
    data['usePointLimit'] = this.usePointLimit;
    data['id'] = this.id;
    data['giftGrowth'] = this.giftGrowth;
    data['stock'] = this.stock;
    data['publishStatus'] = this.publishStatus;
    data['promotionType'] = this.promotionType;
    data['brandName'] = this.brandName;
    data['productSn'] = this.productSn;
    data['albumPics'] = this.albumPics;
    data['productAttributeCategoryId'] = this.productAttributeCategoryId;
    data['weight'] = this.weight;
    data['detailTitle'] = this.detailTitle;
    data['sort'] = this.sort;
    data['giftPoint'] = this.giftPoint;
    data['promotionPerLimit'] = this.promotionPerLimit;
    data['sale'] = this.sale;
    data['unit'] = this.unit;
    data['serviceIds'] = this.serviceIds;
    data['brandId'] = this.brandId;
    data['name'] = this.name;
    data['previewStatus'] = this.previewStatus;
    return data;
  }
}

class ContentRespDataSubjectlist {
  String createTime;
  int collectCount;
  String description;
  int showStatus;
  int id;
  String pic;
  String title;
  int readCount;
  String categoryName;
  int categoryId;
  int recommendStatus;
  int commentCount;

  ContentRespDataSubjectlist(
      {this.createTime,
      this.collectCount,
      this.description,
      this.showStatus,
      this.id,
      this.pic,
      this.title,
      this.readCount,
      this.categoryName,
      this.categoryId,
      this.recommendStatus,
      this.commentCount});

  ContentRespDataSubjectlist.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    collectCount = json['collectCount'];
    description = json['description'];
    showStatus = json['showStatus'];
    id = json['id'];
    pic = json['pic'];
    title = json['title'];
    readCount = json['readCount'];
    categoryName = json['categoryName'];
    categoryId = json['categoryId'];
    recommendStatus = json['recommendStatus'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['collectCount'] = this.collectCount;
    data['description'] = this.description;
    data['showStatus'] = this.showStatus;
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['title'] = this.title;
    data['readCount'] = this.readCount;
    data['categoryName'] = this.categoryName;
    data['categoryId'] = this.categoryId;
    data['recommendStatus'] = this.recommendStatus;
    data['commentCount'] = this.commentCount;
    return data;
  }
}

class ContentRespDataHomeflashpromotion {
  ContentRespDataHomeflashpromotion();

  ContentRespDataHomeflashpromotion.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class ContentRespDataHotproductlist {
  String note;
  int newStatus;
  double originalPrice;
  String keywords;
  String productCategoryName;
  int feightTemplateId;
  int lowStock;
  String description;
  String pic;
  int productCategoryId;
  int recommandStatus;
  int verifyStatus;
  String subTitle;
  int deleteStatus;
  double price;
  int usePointLimit;
  int id;
  int giftGrowth;
  int stock;
  int publishStatus;
  int promotionType;
  String brandName;
  String productSn;
  String albumPics;
  int productAttributeCategoryId;
  double weight;
  String detailTitle;
  int sort;
  int giftPoint;
  int promotionPerLimit;
  int sale;
  String unit;
  String serviceIds;
  int brandId;
  String name;
  int previewStatus;

  ContentRespDataHotproductlist(
      {this.note,
      this.newStatus,
      this.originalPrice,
      this.keywords,
      this.productCategoryName,
      this.feightTemplateId,
      this.lowStock,
      this.description,
      this.pic,
      this.productCategoryId,
      this.recommandStatus,
      this.verifyStatus,
      this.subTitle,
      this.deleteStatus,
      this.price,
      this.usePointLimit,
      this.id,
      this.giftGrowth,
      this.stock,
      this.publishStatus,
      this.promotionType,
      this.brandName,
      this.productSn,
      this.albumPics,
      this.productAttributeCategoryId,
      this.weight,
      this.detailTitle,
      this.sort,
      this.giftPoint,
      this.promotionPerLimit,
      this.sale,
      this.unit,
      this.serviceIds,
      this.brandId,
      this.name,
      this.previewStatus});

  ContentRespDataHotproductlist.fromJson(Map<String, dynamic> json) {
    note = json['note'];
    newStatus = json['newStatus'];
    originalPrice = json['originalPrice'];
    keywords = json['keywords'];
    productCategoryName = json['productCategoryName'];
    feightTemplateId = json['feightTemplateId'];
    lowStock = json['lowStock'];
    description = json['description'];
    pic = json['pic'];
    productCategoryId = json['productCategoryId'];
    recommandStatus = json['recommandStatus'];
    verifyStatus = json['verifyStatus'];
    subTitle = json['subTitle'];
    deleteStatus = json['deleteStatus'];
    price = json['price'];
    usePointLimit = json['usePointLimit'];
    id = json['id'];
    giftGrowth = json['giftGrowth'];
    stock = json['stock'];
    publishStatus = json['publishStatus'];
    promotionType = json['promotionType'];
    brandName = json['brandName'];
    productSn = json['productSn'];
    albumPics = json['albumPics'];
    productAttributeCategoryId = json['productAttributeCategoryId'];
    weight = json['weight'];
    detailTitle = json['detailTitle'];
    sort = json['sort'];
    giftPoint = json['giftPoint'];
    promotionPerLimit = json['promotionPerLimit'];
    sale = json['sale'];
    unit = json['unit'];
    serviceIds = json['serviceIds'];
    brandId = json['brandId'];
    name = json['name'];
    previewStatus = json['previewStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note'] = this.note;
    data['newStatus'] = this.newStatus;
    data['originalPrice'] = this.originalPrice;
    data['keywords'] = this.keywords;
    data['productCategoryName'] = this.productCategoryName;
    data['feightTemplateId'] = this.feightTemplateId;
    data['lowStock'] = this.lowStock;
    data['description'] = this.description;
    data['pic'] = this.pic;
    data['productCategoryId'] = this.productCategoryId;
    data['recommandStatus'] = this.recommandStatus;
    data['verifyStatus'] = this.verifyStatus;
    data['subTitle'] = this.subTitle;
    data['deleteStatus'] = this.deleteStatus;
    data['price'] = this.price;
    data['usePointLimit'] = this.usePointLimit;
    data['id'] = this.id;
    data['giftGrowth'] = this.giftGrowth;
    data['stock'] = this.stock;
    data['publishStatus'] = this.publishStatus;
    data['promotionType'] = this.promotionType;
    data['brandName'] = this.brandName;
    data['productSn'] = this.productSn;
    data['albumPics'] = this.albumPics;
    data['productAttributeCategoryId'] = this.productAttributeCategoryId;
    data['weight'] = this.weight;
    data['detailTitle'] = this.detailTitle;
    data['sort'] = this.sort;
    data['giftPoint'] = this.giftPoint;
    data['promotionPerLimit'] = this.promotionPerLimit;
    data['sale'] = this.sale;
    data['unit'] = this.unit;
    data['serviceIds'] = this.serviceIds;
    data['brandId'] = this.brandId;
    data['name'] = this.name;
    data['previewStatus'] = this.previewStatus;
    return data;
  }
}

class ContentRespDataBrandlist {
  int productCommentCount;
  String name;
  String bigPic;
  String logo;
  int showStatus;
  int id;
  int sort;
  int productCount;
  String firstLetter;
  int factoryStatus;

  ContentRespDataBrandlist(
      {this.productCommentCount,
      this.name,
      this.bigPic,
      this.logo,
      this.showStatus,
      this.id,
      this.sort,
      this.productCount,
      this.firstLetter,
      this.factoryStatus});

  ContentRespDataBrandlist.fromJson(Map<String, dynamic> json) {
    productCommentCount = json['productCommentCount'];
    name = json['name'];
    bigPic = json['bigPic'];
    logo = json['logo'];
    showStatus = json['showStatus'];
    id = json['id'];
    sort = json['sort'];
    productCount = json['productCount'];
    firstLetter = json['firstLetter'];
    factoryStatus = json['factoryStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productCommentCount'] = this.productCommentCount;
    data['name'] = this.name;
    data['bigPic'] = this.bigPic;
    data['logo'] = this.logo;
    data['showStatus'] = this.showStatus;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['productCount'] = this.productCount;
    data['firstLetter'] = this.firstLetter;
    data['factoryStatus'] = this.factoryStatus;
    return data;
  }
}

class ContentRespDataAdvertiselist {
  String note;
  int clickCount;
  String name;
  int orderCount;
  String startTime;
  int id;
  String pic;
  String endTime;
  int sort;
  int type;
  String url;
  int status;

  ContentRespDataAdvertiselist(
      {this.note,
      this.clickCount,
      this.name,
      this.orderCount,
      this.startTime,
      this.id,
      this.pic,
      this.endTime,
      this.sort,
      this.type,
      this.url,
      this.status});

  ContentRespDataAdvertiselist.fromJson(Map<String, dynamic> json) {
    note = json['note'];
    clickCount = json['clickCount'];
    name = json['name'];
    orderCount = json['orderCount'];
    startTime = json['startTime'];
    id = json['id'];
    pic = json['pic'];
    endTime = json['endTime'];
    sort = json['sort'];
    type = json['type'];
    url = json['url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note'] = this.note;
    data['clickCount'] = this.clickCount;
    data['name'] = this.name;
    data['orderCount'] = this.orderCount;
    data['startTime'] = this.startTime;
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['endTime'] = this.endTime;
    data['sort'] = this.sort;
    data['type'] = this.type;
    data['url'] = this.url;
    data['status'] = this.status;
    return data;
  }
}
