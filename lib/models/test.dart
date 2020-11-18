/// all : "8"
/// count : "1"
/// page : "2"
/// lists : []
/// banner : [{"id":"2","title":"能力分类轮播图","image":"http://peiwan.dev.hbbeisheng.com//uploads/20200910/8bd9c5cd37528954e73d7106f2f1f36e.jpg"}]

class Test {
  String _all;
  String _count;
  String _page;
  List<dynamic> _lists;
  List<Banner> _banner;

  String get all => _all;
  String get count => _count;
  String get page => _page;
  List<dynamic> get lists => _lists;
  List<Banner> get banner => _banner;

  Test({
      String all, 
      String count, 
      String page, 
      List<dynamic> lists, 
      List<Banner> banner}){
    _all = all;
    _count = count;
    _page = page;
    _lists = lists;
    _banner = banner;
}

  Test.fromJson(dynamic json) {
    _all = json["all"];
    _count = json["count"];
    _page = json["page"];
    if (json["lists"] != null) {
      _lists = [];
      json["lists"].forEach((v) {
        _lists.add(dynamic.fromJson(v));
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