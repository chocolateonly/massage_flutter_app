import 'package:massageflutterapp/services/http_utils.dart';
//import 'package:massageflutterapp/model/OrderList.dart';
import 'package:massageflutterapp/provider/view_state_refresh_list_model.dart';

class MyOrderListModel extends ViewStateRefreshListModel {
  int order_status;

  void setStatus(cid) {
    if(cid==4){
      order_status = 100;
    }else order_status =cid;
  }

  @override
  Future<List> loadData({int pageNum}) async {
    //OrderList home = await HttpUtils.myOrder(order_status, pageNum);
    //return home.lists;
  }
}