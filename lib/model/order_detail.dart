/// status : "服务中"
/// id : ""
/// name : "zz"
/// address : "sss"
/// address_id : ""
/// order_id : "1"
/// order_title : "测试"
/// order_num : "1"
/// order_time : "20:20"
/// servicer : "张三"
/// remark : "无"
/// order_createtime : "10:20"
/// servicer_mobile : "13476260156"

class OrderDetail {
  String _status;
  String _id;
  String _name;
  String _address;
  String _addressId;
  String _orderId;
  String _orderTitle;
  String _orderNum;
  String _orderTime;
  String _servicer;
  String _remark;
  String _orderCreatetime;
  String _servicerMobile;

  String get status => _status;
  String get id => _id;
  String get name => _name;
  String get address => _address;
  String get addressId => _addressId;
  String get orderId => _orderId;
  String get orderTitle => _orderTitle;
  String get orderNum => _orderNum;
  String get orderTime => _orderTime;
  String get servicer => _servicer;
  String get remark => _remark;
  String get orderCreatetime => _orderCreatetime;
  String get servicerMobile => _servicerMobile;

  OrderDetail({
      String status, 
      String id, 
      String name, 
      String address, 
      String addressId, 
      String orderId, 
      String orderTitle, 
      String orderNum, 
      String orderTime, 
      String servicer, 
      String remark, 
      String orderCreatetime, 
      String servicerMobile}){
    _status = status;
    _id = id;
    _name = name;
    _address = address;
    _addressId = addressId;
    _orderId = orderId;
    _orderTitle = orderTitle;
    _orderNum = orderNum;
    _orderTime = orderTime;
    _servicer = servicer;
    _remark = remark;
    _orderCreatetime = orderCreatetime;
    _servicerMobile = servicerMobile;
}

  OrderDetail.fromJson(dynamic json) {
    _status = json["status"];
    _id = json["id"];
    _name = json["name"];
    _address = json["address"];
    _addressId = json["address_id"];
    _orderId = json["order_id"];
    _orderTitle = json["order_title"];
    _orderNum = json["order_num"];
    _orderTime = json["order_time"];
    _servicer = json["servicer"];
    _remark = json["remark"];
    _orderCreatetime = json["order_createtime"];
    _servicerMobile = json["servicer_mobile"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["id"] = _id;
    map["name"] = _name;
    map["address"] = _address;
    map["address_id"] = _addressId;
    map["order_id"] = _orderId;
    map["order_title"] = _orderTitle;
    map["order_num"] = _orderNum;
    map["order_time"] = _orderTime;
    map["servicer"] = _servicer;
    map["remark"] = _remark;
    map["order_createtime"] = _orderCreatetime;
    map["servicer_mobile"] = _servicerMobile;
    return map;
  }

}