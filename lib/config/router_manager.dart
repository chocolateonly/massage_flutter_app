import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/ui/pages/language/language.dart';
import 'package:massageflutterapp/ui/pages/login/login.dart';
import 'package:massageflutterapp/ui/pages/login/register_word.dart';
import 'package:massageflutterapp/ui/pages/mine/application_form.dart';
import 'package:massageflutterapp/ui/pages/tab/index.dart';
import 'package:massageflutterapp/ui/pages/login/register.dart';
import 'package:massageflutterapp/ui/pages/login/forget_password.dart';
import 'package:massageflutterapp/ui/pages/mine/my_order_list.dart';
import 'package:massageflutterapp/ui/pages/mine/my_info.dart';
import 'package:massageflutterapp/ui/pages/mine/settings.dart';
import 'package:massageflutterapp/ui/pages/mine/agreement_file.dart';
import 'file:///D:/flutter/massage_flutter_app/lib/ui/pages/order/order_detail.dart';
import 'package:massageflutterapp/ui/pages/mine/my_combo.dart';
import 'package:massageflutterapp/ui/pages/mine/order/make_an_appointment.dart';
import 'package:massageflutterapp/ui/pages/mine/my_point.dart';
import 'package:massageflutterapp/ui/pages/mine/point/record.dart';
import 'package:massageflutterapp/ui/pages/mine/point/detail.dart';
import 'package:massageflutterapp/ui/pages/mine/point/result.dart';
import 'package:massageflutterapp/ui/pages/mine/my_earnings.dart';
import 'package:massageflutterapp/ui/pages/mine/account/account_list.dart';
import 'package:massageflutterapp/ui/pages/mine/account/add_account.dart';
import 'package:massageflutterapp/ui/pages/mine/promotion_gift.dart';
import 'package:massageflutterapp/ui/pages/mine/my_coupons.dart';
import 'package:massageflutterapp/ui/pages/mine/address/my_address.dart';
import 'package:massageflutterapp/ui/pages/mine/address/add_or_edit_address.dart';

import 'package:massageflutterapp/ui/pages/home/goods/goods_type.dart';
import 'package:massageflutterapp/ui/pages/home/goods/goods_detail.dart';
import 'package:massageflutterapp/ui/pages/home/goods/create_an_order.dart';
import 'package:massageflutterapp/ui/pages/home/goods/upload_order_result.dart';
import 'package:massageflutterapp/ui/pages/home/goods/massagist_list.dart';
import 'package:massageflutterapp/ui/pages/home/goods/massagist_detail.dart';
import 'package:massageflutterapp/ui/pages/home/goods/massagist_thermography.dart';
import 'package:massageflutterapp/ui/pages/home/goods/massagist_service_prove.dart';
import 'package:massageflutterapp/ui/pages/mine/work_platform.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/service_order_list.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/service_order_detail.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/service_order_room.dart';
import 'package:massageflutterapp/ui/pages/mine/warehouse/my_warehouse.dart';
import 'package:massageflutterapp/ui/pages/mine/warehouse/add_equipment.dart';
import 'package:massageflutterapp/ui/pages/mine/warehouse/equipment_record.dart';
import 'package:massageflutterapp/ui/pages/mine/my_collection.dart';
import 'package:massageflutterapp/ui/pages/order/order_comment.dart';
import 'package:massageflutterapp/ui/pages/order/order_cancel.dart';
import 'package:massageflutterapp/ui/pages/order/complain_form.dart';
import 'package:massageflutterapp/ui/pages/mine/my_organization.dart';
import 'package:massageflutterapp/ui/pages/mine/organization/my_organization_apply.dart';
import 'package:massageflutterapp/ui/pages/mine/apply_word.dart';
import 'package:massageflutterapp/ui/pages/mine/healthy_info.dart';
import 'package:massageflutterapp/ui/pages/mine/my_comments.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/body_status_info.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/personal_settings.dart';
import 'package:massageflutterapp/ui/pages/mine/point/create_an_order.dart';
import 'package:massageflutterapp/ui/pages/mine/earnings/record.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/massagist_level.dart';
class RouteName {
  static const String login = 'login';
  static const String tab = 'tab';
  static const String language='language';
  static const String register='register';
  static const String registerWord='registerWord';//隐私政策
  static const String forgetPassword='forgetPassword';//忘记密码  修改密码
  static const String myInfo='myInfo';//编辑个人信息
  static const String settings='settings';//设置
  static const String myCombo='myCombo';//我的套餐
  static const String makeAnAppointment='makeAnAppointment';//我的套餐  预约
  static const String myOrderList='myOrderList';//我的订单列表
  static const String applicationForm='applicationForm';//应聘表格
  static const String promotionGift='promotionGift';//推广好礼
  static const String myCoupons='myCoupons';
  static const String myPoint='myPoint';
  static const String pointRecord='pointRecord';
  static const String pointDetail='pointDetail';
  static const String pointResult='pointResult';
  static const String createAnPointOrder='createAnPointOrder';//积分下单
  static const String healthyInfo='healthyInfo';
  static const String myEarnings='myEarnings';
  static const String exchangeRecordPage="exchangeRecordPage";//提现记录
  static const String myOrganization='myOrganization';
  static const String myOrganizationApply='myOrganizationApply';
  static const String applyWord='applyWord';
  static const String myComments='myComments';
  static const String myAddress='myAddress';
  static const String addOrEditAddress='addOrEditAddress';
  static const String myCollection='myCollection';
  static const String workPlatform='workPlatform';
  static const String serviceOrder="serviceOrder";//按摩师服务单列表
  static const String serviceOrderDetail="serviceOrderDetail";
  static const String serviceOrderRoom="serviceOrderRoom";//接单大厅
  static const String agreementFile='agreementFile'; //关于平台  隐私协议   用户协议
  static const String orderDetail='orderDetail';//订单详情
  static const String myAccount='myAccount';
  static const String addAccount='addAccount';
  static const String goodsType="goodsType";
  static const String goodsDetail="goodsDetail";
  static const String createAnOrder="createAnOrder";//下订单
  static const String uploadOrderResult="uploadOrderResult";//上传凭证
  static const String massagistList="massagistList";
  static const String massagistDetail="massagistDetail";
  static const String myServiceProve="myServiceProve";//服务资质
  static const String massagistThermography="massagistThermography";//温度记录
  static const String myWarehouse="myWarehouse";
  static const String equipmentRecord="equipmentRecord";
  static const String addEquipment="addEquipment";
  static const String bodyStatusInfo="bodyStatusInfo";
  static const String personalSetting="personalSetting";
  static const String orderComment="orderComment";//预约订单评价
  static const String orderCancel="orderCancel";//预约订单取消
  static const String complainForm="complainForm";//举报投诉  填写备注
  static const String massagistLevel="massagistLevel";
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
   print(settings.name);
    switch (settings.name) {
      case RouteName.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());
     case RouteName.tab:
//        return CupertinoPageRoute(builder: (_) => MassagistLevelPage());
        return CupertinoPageRoute(builder: (_) => TabNavigator());
      case RouteName.language:
        return CupertinoPageRoute(builder: (_) => LanguagePage());
      case RouteName.register:
      return CupertinoPageRoute(builder: (_) => RegisterPage());
      case RouteName.registerWord:
        return CupertinoPageRoute(builder: (_) => RegisterWordPage());
      case RouteName.forgetPassword:
        var list = settings.arguments as List;
        var type=list[0];
        return CupertinoPageRoute(builder: (_) => ForgetPasswordPage(type));
      case RouteName.myInfo:
        return CupertinoPageRoute(builder: (_) => MyInfoPage());
      case RouteName.settings:
        return CupertinoPageRoute(builder: (_) => SettingsPage());
      case RouteName.agreementFile:
        var list = settings.arguments as List;
        var type=list[0];
        var title=list[1];
        return CupertinoPageRoute(builder: (_) => AgreementFilePage(type,title));
      case RouteName.myOrderList:
        var list = settings.arguments as List;
        var type=list[0];
        return CupertinoPageRoute(builder: (_) => MyOrderListPage(type));
      case RouteName.orderDetail:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => OrderDetailPage(id));
      case RouteName.myCombo:
        return CupertinoPageRoute(builder: (_) => MyComboPage());
      case RouteName.makeAnAppointment:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => MakeAnAppointmentPage(id));
      case RouteName.applicationForm:
        return CupertinoPageRoute(builder: (_) => ApplicationFormPage());
      case RouteName.myPoint:
        return CupertinoPageRoute(builder: (_) => MyPointPage());
      case RouteName.pointRecord:
        return CupertinoPageRoute(builder: (_) => PointRecordPage());
      case RouteName.pointDetail:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => PointDetailPage(id));
      case RouteName.createAnPointOrder:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => CreateAnPointOrderPage(id));
      case RouteName.pointResult:
        return CupertinoPageRoute(builder: (_) => PointResultPage());
      case RouteName.myEarnings:
        return CupertinoPageRoute(builder: (_) => MyEarningsPage());
      case RouteName.exchangeRecordPage:
        return CupertinoPageRoute(builder: (_) => ExchangeRecordPage());
      case RouteName.addAccount:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => AddAccountPage(id));
      case RouteName.myAccount:
        return CupertinoPageRoute(builder: (_) => AccountListPage());
      case RouteName.promotionGift:
        return CupertinoPageRoute(builder: (_) => PromotionGiftPage());
      case RouteName.myCoupons:
        return CupertinoPageRoute(builder: (_) => MyCouponsPage());
      case RouteName.myAddress:
        return CupertinoPageRoute(builder: (_) => MyAddressPage());
      case RouteName.addOrEditAddress:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => AddOrEditAddressPage(id));
      case RouteName.goodsType:
        var list = settings.arguments as List;
        var type=list[0];
        var index=list[1];
        return CupertinoPageRoute(builder: (_) => GoodsTypePage(type,index));
      case RouteName.goodsDetail:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => GoodsDetailPage(id));
      case RouteName.createAnOrder:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => CreateAnOrderPage(id));
      case RouteName.uploadOrderResult:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => UploadOrderResultPage(id));
      case RouteName.massagistList:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => MassagistListPage(id));
      case RouteName.massagistDetail:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => MassagistDetailPage(id));
      case RouteName.massagistThermography:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => MassagistServiceProvePage(id));
      case RouteName.workPlatform:
        return CupertinoPageRoute(builder: (_) => WorkPlatformPage());
      case RouteName.serviceOrder:
        var list = settings.arguments as List;
        var type=list[0];
        return CupertinoPageRoute(builder: (_) => ServiceOrderPage(type));
      case RouteName.serviceOrderDetail:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => ServiceOrderDetailPage(id));
      case RouteName.serviceOrderRoom:
        return CupertinoPageRoute(builder: (_) => ServiceOrderRoomPage());
      case RouteName.bodyStatusInfo:
        return CupertinoPageRoute(builder: (_) => BodyStatusInfoPage());
      case RouteName.personalSetting:
        return CupertinoPageRoute(builder: (_) => PersonalSettingsPage());
      case RouteName.myWarehouse:
        return CupertinoPageRoute(builder: (_) => MyWarehousePage());
      case RouteName.addEquipment:
        return CupertinoPageRoute(builder: (_) => AddEquipmentPage());
      case RouteName.equipmentRecord:
        return CupertinoPageRoute(builder: (_) => EquipmentRecordPage());
      case RouteName.myCollection:
        return CupertinoPageRoute(builder: (_) => MyCollectionPage());
      case RouteName.orderComment:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => OrderCommentPage(id));
      case RouteName.orderCancel:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => OrderCancelPage(id));
      case RouteName.complainForm:
        var list = settings.arguments as List;
        var title=list[0];
        var type=list[1];
        return CupertinoPageRoute(builder: (_) => ComplainFormPage(title,type));
      case RouteName.myOrganization:
        return CupertinoPageRoute(builder: (_) => MyOrganizationPage());
      case RouteName.myOrganizationApply:
        return CupertinoPageRoute(builder: (_) => MyOrganizationApplyPage());
      case RouteName.applyWord:
        var list = settings.arguments as List;
        var title=list[0];
        var type=list[1];
        return CupertinoPageRoute(builder: (_) => ApplyWordPage(title,type));
      case RouteName.healthyInfo:
        return CupertinoPageRoute(builder: (_) => HealthyInfoPage());
      case RouteName.myComments:
        return CupertinoPageRoute(builder: (_) => MyCommentsPage());
      case RouteName.massagistLevel:
        return CupertinoPageRoute(builder: (_) => MassagistLevelPage());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
