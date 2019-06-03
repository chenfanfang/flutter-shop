

class HomePageHotGoodsModel {
  String name;
  String image;
  double mallPrice;
  String goodsId;
  double price;

  HomePageHotGoodsModel(
      {this.name, this.image, this.mallPrice, this.goodsId, this.price});

  HomePageHotGoodsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    mallPrice = json['mallPrice'];
    goodsId = json['goodsId'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['mallPrice'] = this.mallPrice;
    data['goodsId'] = this.goodsId;
    data['price'] = this.price;
    return data;
  }
}
