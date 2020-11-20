import 'package:flutter/material.dart';
import 'package:massageflutterapp/model/order_detail.dart';

class OrderDetailModel extends ChangeNotifier{
  var orderDetail;
  @override
  Future loadData({int pageNum}) async {
    orderDetail = OrderDetail.fromJson({
       "status" : "服务中",
        "id":"",
       "name" : "zz",
       "address" : "sss",
       "address_id" : "",
       "order_id" : "1",
       "order_title" : "测试",
       "order_num" : "1",
       "order_time" : "20:20",
       "servicer" : "张三",
       "remark" : "无",
       "order_createtime" : "10:20",
       "servicer_mobile" : "13476260156"
    });
  }
}

