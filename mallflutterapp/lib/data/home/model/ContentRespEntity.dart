import 'package:mallflutterapp/net/BaseResponseEntity.dart';

/// 首页数据详情
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/27
class ContentRespEntity extends BaseResponseEntity{
  HomeFlashPromotionBean homeFlashPromotion;
  List<AdvertiseListListBean> advertiseList;
  List<BrandListListBean> brandList;
  List<HotProductListListBean> hotProductList;
  List<NewProductListListBean> newProductList;
  List<SubjectListListBean> subjectList;

  ContentRespEntity(
      {this.homeFlashPromotion,
      this.advertiseList,
      this.brandList,
      this.hotProductList,
      this.newProductList,
      this.subjectList});

  ContentRespEntity.fromJson(Map<String, dynamic> json) {
    this.homeFlashPromotion = json['homeFlashPromotion'] != null
        ? HomeFlashPromotionBean.fromJson(json['homeFlashPromotion'])
        : null;
    this.advertiseList = (json['advertiseList'] as List) != null
        ? (json['advertiseList'] as List)
            .map((i) => AdvertiseListListBean.fromJson(i))
            .toList()
        : null;
    this.brandList = (json['brandList'] as List) != null
        ? (json['brandList'] as List)
            .map((i) => BrandListListBean.fromJson(i))
            .toList()
        : null;
    this.hotProductList = (json['hotProductList'] as List) != null
        ? (json['hotProductList'] as List)
            .map((i) => HotProductListListBean.fromJson(i))
            .toList()
        : null;
    this.newProductList = (json['newProductList'] as List) != null
        ? (json['newProductList'] as List)
            .map((i) => NewProductListListBean.fromJson(i))
            .toList()
        : null;
    this.subjectList = (json['subjectList'] as List) != null
        ? (json['subjectList'] as List)
            .map((i) => SubjectListListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeFlashPromotion != null) {
      data['homeFlashPromotion'] = this.homeFlashPromotion.toJson();
    }
    data['advertiseList'] = this.advertiseList != null
        ? this.advertiseList.map((i) => i.toJson()).toList()
        : null;
    data['brandList'] = this.brandList != null
        ? this.brandList.map((i) => i.toJson()).toList()
        : null;
    data['hotProductList'] = this.hotProductList != null
        ? this.hotProductList.map((i) => i.toJson()).toList()
        : null;
    data['newProductList'] = this.newProductList != null
        ? this.newProductList.map((i) => i.toJson()).toList()
        : null;
    data['subjectList'] = this.subjectList != null
        ? this.subjectList.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class HomeFlashPromotionBean {
  DateTime startTime;
  DateTime endTime;
  DateTime nextStartTime;
  DateTime nextEndTime;
  List<ProductListListBean> productList;

  HomeFlashPromotionBean(
      {this.startTime,
      this.endTime,
      this.nextStartTime,
      this.nextEndTime,
      this.productList});

  HomeFlashPromotionBean.fromJson(Map<String, dynamic> json) {
    this.startTime = json['startTime'];
    this.endTime = json['endTime'];
    this.nextStartTime = json['nextStartTime'];
    this.nextEndTime = json['nextEndTime'];
    this.productList = (json['productList'] as List) != null
        ? (json['productList'] as List)
            .map((i) => ProductListListBean.fromJson(i))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['nextStartTime'] = this.nextStartTime;
    data['nextEndTime'] = this.nextEndTime;
    data['productList'] = this.productList != null
        ? this.productList.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class AdvertiseListListBean {
  String name;
  String pic;
  String startTime;
  String endTime;
  String url;
  String note;
  int id;
  int type;
  int status;
  int clickCount;
  int orderCount;
  int sort;

  AdvertiseListListBean(
      {this.name,
      this.pic,
      this.startTime,
      this.endTime,
      this.url,
      this.note,
      this.id,
      this.type,
      this.status,
      this.clickCount,
      this.orderCount,
      this.sort});

  AdvertiseListListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.pic = json['pic'];
    this.startTime = json['startTime'];
    this.endTime = json['endTime'];
    this.url = json['url'];
    this.note = json['note'];
    this.id = json['id'];
    this.type = json['type'];
    this.status = json['status'];
    this.clickCount = json['clickCount'];
    this.orderCount = json['orderCount'];
    this.sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['url'] = this.url;
    data['note'] = this.note;
    data['id'] = this.id;
    data['type'] = this.type;
    data['status'] = this.status;
    data['clickCount'] = this.clickCount;
    data['orderCount'] = this.orderCount;
    data['sort'] = this.sort;
    return data;
  }
}

class BrandListListBean {
  String name;
  String firstLetter;
  String logo;
  String bigPic;
  int id;
  int sort;
  int factoryStatus;
  int showStatus;
  int productCount;
  int productCommentCount;

  BrandListListBean(
      {this.name,
      this.firstLetter,
      this.logo,
      this.bigPic,
      this.id,
      this.sort,
      this.factoryStatus,
      this.showStatus,
      this.productCount,
      this.productCommentCount});

  BrandListListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.firstLetter = json['firstLetter'];
    this.logo = json['logo'];
    this.bigPic = json['bigPic'];
    this.id = json['id'];
    this.sort = json['sort'];
    this.factoryStatus = json['factoryStatus'];
    this.showStatus = json['showStatus'];
    this.productCount = json['productCount'];
    this.productCommentCount = json['productCommentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['firstLetter'] = this.firstLetter;
    data['logo'] = this.logo;
    data['bigPic'] = this.bigPic;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['factoryStatus'] = this.factoryStatus;
    data['showStatus'] = this.showStatus;
    data['productCount'] = this.productCount;
    data['productCommentCount'] = this.productCommentCount;
    return data;
  }
}

class HotProductListListBean {
  String name;
  String pic;
  String productSn;
  String subTitle;
  String unit;
  String serviceIds;
  String keywords;
  String note;
  String albumPics;
  String detailTitle;
  String brandName;
  String productCategoryName;
  String description;
  int id;
  int brandId;
  int productCategoryId;
  int feightTemplateId;
  int productAttributeCategoryId;
  int deleteStatus;
  int publishStatus;
  int newStatus;
  int recommandStatus;
  int verifyStatus;
  int sort;
  int sale;
  double price;
  int giftGrowth;
  int giftPoint;
  int usePointLimit;
  double originalPrice;
  int stock;
  int lowStock;
  double weight;
  int previewStatus;
  int promotionPerLimit;
  int promotionType;

  HotProductListListBean(
      {this.name,
      this.pic,
      this.productSn,
      this.subTitle,
      this.unit,
      this.serviceIds,
      this.keywords,
      this.note,
      this.albumPics,
      this.detailTitle,
      this.brandName,
      this.productCategoryName,
      this.description,
      this.id,
      this.brandId,
      this.productCategoryId,
      this.feightTemplateId,
      this.productAttributeCategoryId,
      this.deleteStatus,
      this.publishStatus,
      this.newStatus,
      this.recommandStatus,
      this.verifyStatus,
      this.sort,
      this.sale,
      this.price,
      this.giftGrowth,
      this.giftPoint,
      this.usePointLimit,
      this.originalPrice,
      this.stock,
      this.lowStock,
      this.weight,
      this.previewStatus,
      this.promotionPerLimit,
      this.promotionType});

  HotProductListListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.pic = json['pic'];
    this.productSn = json['productSn'];
    this.subTitle = json['subTitle'];
    this.unit = json['unit'];
    this.serviceIds = json['serviceIds'];
    this.keywords = json['keywords'];
    this.note = json['note'];
    this.albumPics = json['albumPics'];
    this.detailTitle = json['detailTitle'];
    this.brandName = json['brandName'];
    this.productCategoryName = json['productCategoryName'];
    this.description = json['description'];
    this.id = json['id'];
    this.brandId = json['brandId'];
    this.productCategoryId = json['productCategoryId'];
    this.feightTemplateId = json['feightTemplateId'];
    this.productAttributeCategoryId = json['productAttributeCategoryId'];
    this.deleteStatus = json['deleteStatus'];
    this.publishStatus = json['publishStatus'];
    this.newStatus = json['newStatus'];
    this.recommandStatus = json['recommandStatus'];
    this.verifyStatus = json['verifyStatus'];
    this.sort = json['sort'];
    this.sale = json['sale'];
    this.price = json['price'];
    this.giftGrowth = json['giftGrowth'];
    this.giftPoint = json['giftPoint'];
    this.usePointLimit = json['usePointLimit'];
    this.originalPrice = json['originalPrice'];
    this.stock = json['stock'];
    this.lowStock = json['lowStock'];
    this.weight = json['weight'];
    this.previewStatus = json['previewStatus'];
    this.promotionPerLimit = json['promotionPerLimit'];
    this.promotionType = json['promotionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['productSn'] = this.productSn;
    data['subTitle'] = this.subTitle;
    data['unit'] = this.unit;
    data['serviceIds'] = this.serviceIds;
    data['keywords'] = this.keywords;
    data['note'] = this.note;
    data['albumPics'] = this.albumPics;
    data['detailTitle'] = this.detailTitle;
    data['brandName'] = this.brandName;
    data['productCategoryName'] = this.productCategoryName;
    data['description'] = this.description;
    data['id'] = this.id;
    data['brandId'] = this.brandId;
    data['productCategoryId'] = this.productCategoryId;
    data['feightTemplateId'] = this.feightTemplateId;
    data['productAttributeCategoryId'] = this.productAttributeCategoryId;
    data['deleteStatus'] = this.deleteStatus;
    data['publishStatus'] = this.publishStatus;
    data['newStatus'] = this.newStatus;
    data['recommandStatus'] = this.recommandStatus;
    data['verifyStatus'] = this.verifyStatus;
    data['sort'] = this.sort;
    data['sale'] = this.sale;
    data['price'] = this.price;
    data['giftGrowth'] = this.giftGrowth;
    data['giftPoint'] = this.giftPoint;
    data['usePointLimit'] = this.usePointLimit;
    data['originalPrice'] = this.originalPrice;
    data['stock'] = this.stock;
    data['lowStock'] = this.lowStock;
    data['weight'] = this.weight;
    data['previewStatus'] = this.previewStatus;
    data['promotionPerLimit'] = this.promotionPerLimit;
    data['promotionType'] = this.promotionType;
    return data;
  }
}

class NewProductListListBean {
  String name;
  String pic;
  String productSn;
  String subTitle;
  String unit;
  String serviceIds;
  String keywords;
  String note;
  String albumPics;
  String detailTitle;
  String brandName;
  String productCategoryName;
  String description;
  int id;
  int brandId;
  int productCategoryId;
  int feightTemplateId;
  int productAttributeCategoryId;
  int deleteStatus;
  int publishStatus;
  int newStatus;
  int recommandStatus;
  int verifyStatus;
  int sort;
  int sale;
  double price;
  int giftGrowth;
  int giftPoint;
  int usePointLimit;
  double originalPrice;
  int stock;
  int lowStock;
  double weight;
  int previewStatus;
  int promotionPerLimit;
  int promotionType;

  NewProductListListBean(
      {this.name,
      this.pic,
      this.productSn,
      this.subTitle,
      this.unit,
      this.serviceIds,
      this.keywords,
      this.note,
      this.albumPics,
      this.detailTitle,
      this.brandName,
      this.productCategoryName,
      this.description,
      this.id,
      this.brandId,
      this.productCategoryId,
      this.feightTemplateId,
      this.productAttributeCategoryId,
      this.deleteStatus,
      this.publishStatus,
      this.newStatus,
      this.recommandStatus,
      this.verifyStatus,
      this.sort,
      this.sale,
      this.price,
      this.giftGrowth,
      this.giftPoint,
      this.usePointLimit,
      this.originalPrice,
      this.stock,
      this.lowStock,
      this.weight,
      this.previewStatus,
      this.promotionPerLimit,
      this.promotionType});

  NewProductListListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.pic = json['pic'];
    this.productSn = json['productSn'];
    this.subTitle = json['subTitle'];
    this.unit = json['unit'];
    this.serviceIds = json['serviceIds'];
    this.keywords = json['keywords'];
    this.note = json['note'];
    this.albumPics = json['albumPics'];
    this.detailTitle = json['detailTitle'];
    this.brandName = json['brandName'];
    this.productCategoryName = json['productCategoryName'];
    this.description = json['description'];
    this.id = json['id'];
    this.brandId = json['brandId'];
    this.productCategoryId = json['productCategoryId'];
    this.feightTemplateId = json['feightTemplateId'];
    this.productAttributeCategoryId = json['productAttributeCategoryId'];
    this.deleteStatus = json['deleteStatus'];
    this.publishStatus = json['publishStatus'];
    this.newStatus = json['newStatus'];
    this.recommandStatus = json['recommandStatus'];
    this.verifyStatus = json['verifyStatus'];
    this.sort = json['sort'];
    this.sale = json['sale'];
    this.price = json['price'];
    this.giftGrowth = json['giftGrowth'];
    this.giftPoint = json['giftPoint'];
    this.usePointLimit = json['usePointLimit'];
    this.originalPrice = json['originalPrice'];
    this.stock = json['stock'];
    this.lowStock = json['lowStock'];
    this.weight = json['weight'];
    this.previewStatus = json['previewStatus'];
    this.promotionPerLimit = json['promotionPerLimit'];
    this.promotionType = json['promotionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['productSn'] = this.productSn;
    data['subTitle'] = this.subTitle;
    data['unit'] = this.unit;
    data['serviceIds'] = this.serviceIds;
    data['keywords'] = this.keywords;
    data['note'] = this.note;
    data['albumPics'] = this.albumPics;
    data['detailTitle'] = this.detailTitle;
    data['brandName'] = this.brandName;
    data['productCategoryName'] = this.productCategoryName;
    data['description'] = this.description;
    data['id'] = this.id;
    data['brandId'] = this.brandId;
    data['productCategoryId'] = this.productCategoryId;
    data['feightTemplateId'] = this.feightTemplateId;
    data['productAttributeCategoryId'] = this.productAttributeCategoryId;
    data['deleteStatus'] = this.deleteStatus;
    data['publishStatus'] = this.publishStatus;
    data['newStatus'] = this.newStatus;
    data['recommandStatus'] = this.recommandStatus;
    data['verifyStatus'] = this.verifyStatus;
    data['sort'] = this.sort;
    data['sale'] = this.sale;
    data['price'] = this.price;
    data['giftGrowth'] = this.giftGrowth;
    data['giftPoint'] = this.giftPoint;
    data['usePointLimit'] = this.usePointLimit;
    data['originalPrice'] = this.originalPrice;
    data['stock'] = this.stock;
    data['lowStock'] = this.lowStock;
    data['weight'] = this.weight;
    data['previewStatus'] = this.previewStatus;
    data['promotionPerLimit'] = this.promotionPerLimit;
    data['promotionType'] = this.promotionType;
    return data;
  }
}

class SubjectListListBean {
  String title;
  String pic;
  String createTime;
  String description;
  String categoryName;
  int id;
  int categoryId;
  int recommendStatus;
  int collectCount;
  int readCount;
  int commentCount;
  int showStatus;

  SubjectListListBean(
      {this.title,
      this.pic,
      this.createTime,
      this.description,
      this.categoryName,
      this.id,
      this.categoryId,
      this.recommendStatus,
      this.collectCount,
      this.readCount,
      this.commentCount,
      this.showStatus});

  SubjectListListBean.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.pic = json['pic'];
    this.createTime = json['createTime'];
    this.description = json['description'];
    this.categoryName = json['categoryName'];
    this.id = json['id'];
    this.categoryId = json['categoryId'];
    this.recommendStatus = json['recommendStatus'];
    this.collectCount = json['collectCount'];
    this.readCount = json['readCount'];
    this.commentCount = json['commentCount'];
    this.showStatus = json['showStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['pic'] = this.pic;
    data['createTime'] = this.createTime;
    data['description'] = this.description;
    data['categoryName'] = this.categoryName;
    data['id'] = this.id;
    data['categoryId'] = this.categoryId;
    data['recommendStatus'] = this.recommendStatus;
    data['collectCount'] = this.collectCount;
    data['readCount'] = this.readCount;
    data['commentCount'] = this.commentCount;
    data['showStatus'] = this.showStatus;
    return data;
  }
}

class ProductListListBean {
  String name;
  String pic;
  String productSn;
  String subTitle;
  String unit;
  String serviceIds;
  String keywords;
  String note;
  String albumPics;
  String detailTitle;
  String brandName;
  String productCategoryName;
  String description;
  int id;
  int brandId;
  int productCategoryId;
  int feightTemplateId;
  int productAttributeCategoryId;
  int deleteStatus;
  int publishStatus;
  int newStatus;
  int recommandStatus;
  int verifyStatus;
  int sort;
  int sale;
  double price;
  int giftGrowth;
  int giftPoint;
  int usePointLimit;
  double originalPrice;
  int stock;
  int lowStock;
  double weight;
  int previewStatus;
  int promotionPerLimit;
  int promotionType;
  double flashPromotionPrice;
  int flashPromotionCount;
  int flashPromotionLimit;

  ProductListListBean(
      {this.name,
      this.pic,
      this.productSn,
      this.subTitle,
      this.unit,
      this.serviceIds,
      this.keywords,
      this.note,
      this.albumPics,
      this.detailTitle,
      this.brandName,
      this.productCategoryName,
      this.description,
      this.id,
      this.brandId,
      this.productCategoryId,
      this.feightTemplateId,
      this.productAttributeCategoryId,
      this.deleteStatus,
      this.publishStatus,
      this.newStatus,
      this.recommandStatus,
      this.verifyStatus,
      this.sort,
      this.sale,
      this.price,
      this.giftGrowth,
      this.giftPoint,
      this.usePointLimit,
      this.originalPrice,
      this.stock,
      this.lowStock,
      this.weight,
      this.previewStatus,
      this.promotionPerLimit,
      this.promotionType,
      this.flashPromotionPrice,
      this.flashPromotionCount,
      this.flashPromotionLimit});

  ProductListListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.pic = json['pic'];
    this.productSn = json['productSn'];
    this.subTitle = json['subTitle'];
    this.unit = json['unit'];
    this.serviceIds = json['serviceIds'];
    this.keywords = json['keywords'];
    this.note = json['note'];
    this.albumPics = json['albumPics'];
    this.detailTitle = json['detailTitle'];
    this.brandName = json['brandName'];
    this.productCategoryName = json['productCategoryName'];
    this.description = json['description'];
    this.id = json['id'];
    this.brandId = json['brandId'];
    this.productCategoryId = json['productCategoryId'];
    this.feightTemplateId = json['feightTemplateId'];
    this.productAttributeCategoryId = json['productAttributeCategoryId'];
    this.deleteStatus = json['deleteStatus'];
    this.publishStatus = json['publishStatus'];
    this.newStatus = json['newStatus'];
    this.recommandStatus = json['recommandStatus'];
    this.verifyStatus = json['verifyStatus'];
    this.sort = json['sort'];
    this.sale = json['sale'];
    this.price = json['price'];
    this.giftGrowth = json['giftGrowth'];
    this.giftPoint = json['giftPoint'];
    this.usePointLimit = json['usePointLimit'];
    this.originalPrice = json['originalPrice'];
    this.stock = json['stock'];
    this.lowStock = json['lowStock'];
    this.weight = json['weight'];
    this.previewStatus = json['previewStatus'];
    this.promotionPerLimit = json['promotionPerLimit'];
    this.promotionType = json['promotionType'];
    this.flashPromotionPrice = json['flashPromotionPrice'];
    this.flashPromotionCount = json['flashPromotionCount'];
    this.flashPromotionLimit = json['flashPromotionLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['productSn'] = this.productSn;
    data['subTitle'] = this.subTitle;
    data['unit'] = this.unit;
    data['serviceIds'] = this.serviceIds;
    data['keywords'] = this.keywords;
    data['note'] = this.note;
    data['albumPics'] = this.albumPics;
    data['detailTitle'] = this.detailTitle;
    data['brandName'] = this.brandName;
    data['productCategoryName'] = this.productCategoryName;
    data['description'] = this.description;
    data['id'] = this.id;
    data['brandId'] = this.brandId;
    data['productCategoryId'] = this.productCategoryId;
    data['feightTemplateId'] = this.feightTemplateId;
    data['productAttributeCategoryId'] = this.productAttributeCategoryId;
    data['deleteStatus'] = this.deleteStatus;
    data['publishStatus'] = this.publishStatus;
    data['newStatus'] = this.newStatus;
    data['recommandStatus'] = this.recommandStatus;
    data['verifyStatus'] = this.verifyStatus;
    data['sort'] = this.sort;
    data['sale'] = this.sale;
    data['price'] = this.price;
    data['giftGrowth'] = this.giftGrowth;
    data['giftPoint'] = this.giftPoint;
    data['usePointLimit'] = this.usePointLimit;
    data['originalPrice'] = this.originalPrice;
    data['stock'] = this.stock;
    data['lowStock'] = this.lowStock;
    data['weight'] = this.weight;
    data['previewStatus'] = this.previewStatus;
    data['promotionPerLimit'] = this.promotionPerLimit;
    data['promotionType'] = this.promotionType;
    data['flashPromotionPrice'] = this.flashPromotionPrice;
    data['flashPromotionCount'] = this.flashPromotionCount;
    data['flashPromotionLimit'] = this.flashPromotionLimit;
    return data;
  }
}
