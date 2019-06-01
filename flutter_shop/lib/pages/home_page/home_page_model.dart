class HomePageModel {
  List<HomePageSlideModel> slides;
  HomePageShopInfoModel shopInfo;
  HomePagePictureModel integralMallPic;
  HomePagePictureModel toShareCode;
  List<HomePageRecommendModel> recommend;
  HomePagePictureModel advertesPicture;
  List<HomePageGoodsModel> floor1;
  List<HomePageGoodsModel> floor2;
  List<HomePageGoodsModel> floor3;
  HomePagePictureModel saoma;
  HomePagePictureModel newUser;
  HomePagePictureModel floor1Pic;
  HomePagePictureModel floor2Pic;
  HomePageFloorNameModel floorName;
  List<HomePageCategoryModel> category;
  HomePagePictureModel floor3Pic;

  HomePageModel(
      {this.slides,
        this.shopInfo,
        this.integralMallPic,
        this.toShareCode,
        this.recommend,
        this.advertesPicture,
        this.floor1,
        this.floor2,
        this.floor3,
        this.saoma,
        this.newUser,
        this.floor1Pic,
        this.floor2Pic,
        this.floorName,
        this.category,
        this.floor3Pic});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    if (json['slides'] != null) {
      slides = new List<HomePageSlideModel>();
      json['slides'].forEach((v) {
        slides.add(new HomePageSlideModel.fromJson(v));
      });
    }
    shopInfo = json['shopInfo'] != null
        ? new HomePageShopInfoModel.fromJson(json['shopInfo'])
        : null;
    integralMallPic = json['integralMallPic'] != null
        ? new HomePagePictureModel.fromJson(json['integralMallPic'])
        : null;
    toShareCode = json['toShareCode'] != null
        ? new HomePagePictureModel.fromJson(json['toShareCode'])
        : null;
    if (json['recommend'] != null) {
      recommend = new List<HomePageRecommendModel>();
      json['recommend'].forEach((v) {
        recommend.add(new HomePageRecommendModel.fromJson(v));
      });
    }
    advertesPicture = json['advertesPicture'] != null
        ? new HomePagePictureModel.fromJson(json['advertesPicture'])
        : null;
    if (json['floor1'] != null) {
      floor1 = new List<HomePageGoodsModel>();
      json['floor1'].forEach((v) {
        floor1.add(new HomePageGoodsModel.fromJson(v));
      });
    }
    if (json['floor2'] != null) {
      floor2 = new List<HomePageGoodsModel>();
      json['floor2'].forEach((v) {
        floor2.add(new HomePageGoodsModel.fromJson(v));
      });
    }
    if (json['floor3'] != null) {
      floor3 = new List<HomePageGoodsModel>();
      json['floor3'].forEach((v) {
        floor3.add(new HomePageGoodsModel.fromJson(v));
      });
    }
    saoma = json['saoma'] != null ? new HomePagePictureModel.fromJson(json['saoma']) : null;
    newUser =
    json['newUser'] != null ? new HomePagePictureModel.fromJson(json['newUser']) : null;
    floor1Pic = json['floor1Pic'] != null
        ? new HomePagePictureModel.fromJson(json['floor1Pic'])
        : null;
    floor2Pic = json['floor2Pic'] != null
        ? new HomePagePictureModel.fromJson(json['floor2Pic'])
        : null;
    floorName = json['floorName'] != null
        ? new HomePageFloorNameModel.fromJson(json['floorName'])
        : null;
    if (json['category'] != null) {
      category = new List<HomePageCategoryModel>();
      json['category'].forEach((v) {
        category.add(new HomePageCategoryModel.fromJson(v));
      });
    }
    floor3Pic = json['floor3Pic'] != null
        ? new HomePagePictureModel.fromJson(json['floor3Pic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slides != null) {
      data['slides'] = this.slides.map((v) => v.toJson()).toList();
    }
    if (this.shopInfo != null) {
      data['shopInfo'] = this.shopInfo.toJson();
    }
    if (this.integralMallPic != null) {
      data['integralMallPic'] = this.integralMallPic.toJson();
    }
    if (this.toShareCode != null) {
      data['toShareCode'] = this.toShareCode.toJson();
    }
    if (this.recommend != null) {
      data['recommend'] = this.recommend.map((v) => v.toJson()).toList();
    }
    if (this.advertesPicture != null) {
      data['advertesPicture'] = this.advertesPicture.toJson();
    }
    if (this.floor1 != null) {
      data['floor1'] = this.floor1.map((v) => v.toJson()).toList();
    }
    if (this.floor2 != null) {
      data['floor2'] = this.floor2.map((v) => v.toJson()).toList();
    }
    if (this.floor3 != null) {
      data['floor3'] = this.floor3.map((v) => v.toJson()).toList();
    }
    if (this.saoma != null) {
      data['saoma'] = this.saoma.toJson();
    }
    if (this.newUser != null) {
      data['newUser'] = this.newUser.toJson();
    }
    if (this.floor1Pic != null) {
      data['floor1Pic'] = this.floor1Pic.toJson();
    }
    if (this.floor2Pic != null) {
      data['floor2Pic'] = this.floor2Pic.toJson();
    }
    if (this.floorName != null) {
      data['floorName'] = this.floorName.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    if (this.floor3Pic != null) {
      data['floor3Pic'] = this.floor3Pic.toJson();
    }
    return data;
  }
}

class HomePageSlideModel {
  String image;
  String goodsId;

  HomePageSlideModel({this.image, this.goodsId});

  HomePageSlideModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['goodsId'] = this.goodsId;
    return data;
  }
}

class HomePageShopInfoModel {
  String leaderImage;
  String leaderPhone;

  HomePageShopInfoModel({this.leaderImage, this.leaderPhone});

  HomePageShopInfoModel.fromJson(Map<String, dynamic> json) {
    leaderImage = json['leaderImage'];
    leaderPhone = json['leaderPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaderImage'] = this.leaderImage;
    data['leaderPhone'] = this.leaderPhone;
    return data;
  }
}

class HomePagePictureModel {
  String pICTUREADDRESS;
  String tOPLACE;

  HomePagePictureModel({this.pICTUREADDRESS, this.tOPLACE});

  HomePagePictureModel.fromJson(Map<String, dynamic> json) {
    pICTUREADDRESS = json['PICTURE_ADDRESS'];
    tOPLACE = json['TO_PLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this.pICTUREADDRESS;
    data['TO_PLACE'] = this.tOPLACE;
    return data;
  }
}



class HomePageRecommendModel {
  String image;
  double mallPrice;
  String goodsName;
  String goodsId;
  double price;

  HomePageRecommendModel(
      {this.image, this.mallPrice, this.goodsName, this.goodsId, this.price});

  HomePageRecommendModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}



class HomePageGoodsModel {
  String image;
  String goodsId;

  HomePageGoodsModel({this.image, this.goodsId});

  HomePageGoodsModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['goodsId'] = this.goodsId;
    return data;
  }
}



class HomePageFloorNameModel {
  String floor1;
  String floor2;
  String floor3;

  HomePageFloorNameModel({this.floor1, this.floor2, this.floor3});

  HomePageFloorNameModel.fromJson(Map<String, dynamic> json) {
    floor1 = json['floor1'];
    floor2 = json['floor2'];
    floor3 = json['floor3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor1'] = this.floor1;
    data['floor2'] = this.floor2;
    data['floor3'] = this.floor3;
    return data;
  }
}

class HomePageCategoryModel {
  String mallCategoryId;
  String mallCategoryName;
  List<HomePageBxMallSubDtoModel> bxMallSubDto;
  Null comments;
  String image;

  HomePageCategoryModel(
      {this.mallCategoryId,
        this.mallCategoryName,
        this.bxMallSubDto,
        this.comments,
        this.image});

  HomePageCategoryModel.fromJson(Map<String, dynamic> json) {
    mallCategoryId = json['mallCategoryId'];
    mallCategoryName = json['mallCategoryName'];
    if (json['bxMallSubDto'] != null) {
      bxMallSubDto = new List<HomePageBxMallSubDtoModel>();
      json['bxMallSubDto'].forEach((v) {
        bxMallSubDto.add(new HomePageBxMallSubDtoModel.fromJson(v));
      });
    }
    comments = json['comments'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallCategoryName'] = this.mallCategoryName;
    if (this.bxMallSubDto != null) {
      data['bxMallSubDto'] = this.bxMallSubDto.map((v) => v.toJson()).toList();
    }
    data['comments'] = this.comments;
    data['image'] = this.image;
    return data;
  }
}

class HomePageBxMallSubDtoModel {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  HomePageBxMallSubDtoModel(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  HomePageBxMallSubDtoModel.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = this.mallSubId;
    data['mallCategoryId'] = this.mallCategoryId;
    data['mallSubName'] = this.mallSubName;
    data['comments'] = this.comments;
    return data;
  }
}


