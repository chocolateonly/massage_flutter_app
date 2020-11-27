/// 子类需要重写
abstract class BSBaseResponse {
  String code = '200';
  String desc;
  dynamic data;

  bool get success;

  BSBaseResponse({this.code, this.desc, this.data});

  @override
  String toString() {
    return 'BSBaseResponse{code: $code, desc: $desc, data: $data}';
  }
}

class BSReturn extends BSBaseResponse {
  bool get success => '200' == code;

  BSReturn.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    desc = json['desc'];
    data = json['data'];
  }

  static getData(code, desc, data) {
    final Map<String, dynamic> data2 = new Map<String, dynamic>();
    data2['code'] = code;
    data2['desc'] = desc;
    data2['data'] = data;
    return BSReturn.fromJson(data2);
  }
}
