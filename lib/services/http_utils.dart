import 'package:massageflutterapp/model/my_order_list.dart';
import 'package:massageflutterapp/services/api.dart';
import 'package:massageflutterapp/services/http_api.dart';
class HttpUtils{

  static Future myOrder(order_status, int page) async {
    var response = await http.post<Map>('api/game/getGameList', data: {"order_status": order_status, "page": "$page", "pageSize": "5","loading":false});
    return MyOrderList.fromJson(response.data);
  }

  static Future uploadFile(FormData file) async{
    var response = await http.post<Map>('api/common/uploadImg', data: file);
    return response.data["path"];
  }
}