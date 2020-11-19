/// all : "8"
/// count : "1"
/// page : "1"
/// lists : [{"id":"1","name":"绝地求生","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/c335f30124825d2166418db47dafdf1d.png"},{"id":"2","name":"英雄联盟","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/4136e3d9407e9faff059f719242ce9d8.png"},{"id":"3","name":"云顶之弈","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/e4cc562c70562cb18e6681640a6d9d16.png"},{"id":"4","name":"CSGO","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/c185e34894e509e3fcf46bc5a0be0313.png"},{"id":"5","name":"穿越火线","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/1c1c45a2c4541c5836c0555e56a610f8.png"},{"id":"6","name":"Dota自走棋","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/eaf99cb1fbc1653f0056cde8720e4b16.png"},{"id":"7","name":"魔兽世界","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/c95aba2f31ceed688e98d32aae731ed4.png"},{"id":"8","name":"Dota2","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200820/0955124b50dbcc847cf9476af0be0bdb.png"}]
/// banner : [{"id":"2","title":"能力分类轮播图","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200910/8bd9c5cd37528954e73d7106f2f1f36e.jpg"}]

class MyOrderList {
  String _all;
  String _count;
  String _page;
  List<Lists> _lists;
  List<Banner> _banner;

  String get all => _all;
  String get count => _count;
  String get page => _page;
  List<Lists> get lists => _lists;
  List<Banner> get banner => _banner;

  MyOrderList({
      String all, 
      String count, 
      String page, 
      List<Lists> lists, 
      List<Banner> banner}){
    _all = all;
    _count = count;
    _page = page;
    _lists = lists;
    _banner = banner;
}

  MyOrderList.fromJson(dynamic json) {
    _all = json["all"];
    _count = json["count"];
    _page = json["page"];
    if (json["lists"] != null) {
      _lists = [];
      json["lists"].forEach((v) {
        _lists.add(Lists.fromJson(v));
      });
    }
    if (json["banner"] != null) {
      _banner = [];
      json["banner"].forEach((v) {
        _banner.add(Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["all"] = _all;
    map["count"] = _count;
    map["page"] = _page;
    if (_lists != null) {
      map["lists"] = _lists.map((v) => v.toJson()).toList();
    }
    if (_banner != null) {
      map["banner"] = _banner.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// title : "能力分类轮播图"
/// image : "http://peiwan.dev.hbbeisheng.com//uploads/20200910/8bd9c5cd37528954e73d7106f2f1f36e.jpg"

class Banner {
  String _id;
  String _title;
  String _image;

  String get id => _id;
  String get title => _title;
  String get image => _image;

  Banner({
      String id, 
      String title, 
      String image}){
    _id = id;
    _title = title;
    _image = image;
}

  Banner.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["image"] = _image;
    return map;
  }

}

/// id : "1"
/// name : "绝地求生"
/// image : "http://peiwan.dev.hbbeisheng.com//uploads/20200820/c335f30124825d2166418db47dafdf1d.png"

class Lists {
  String _id;
  String _name;
  String _image;

  String get id => _id;
  String get name => _name;
  String get image => _image;

  Lists({
      String id, 
      String name, 
      String image}){
    _id = id;
    _name = name;
    _image = image;
}

  Lists.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _image = json["image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["image"] = _image;
    return map;
  }

}