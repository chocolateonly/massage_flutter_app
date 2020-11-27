// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tab1 {
    return Intl.message(
      'Home',
      name: 'tab1',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get tab2 {
    return Intl.message(
      'Order',
      name: 'tab2',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get tab3 {
    return Intl.message(
      'Message',
      name: 'tab3',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get tab4 {
    return Intl.message(
      'Mine',
      name: 'tab4',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `please input`
  String get searchPlaceholder {
    return Intl.message(
      'please input',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `请输入手机号`
  String get phonePlaceholder {
    return Intl.message(
      '请输入手机号',
      name: 'phonePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `请输入密码`
  String get passwordPlaceholder {
    return Intl.message(
      '请输入密码',
      name: 'passwordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入密码`
  String get confirmPasswordPlaceholder {
    return Intl.message(
      '请再次输入密码',
      name: 'confirmPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `两次输入密码不一致`
  String get confirmPasswordError {
    return Intl.message(
      '两次输入密码不一致',
      name: 'confirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `请输入验证码`
  String get phoneCodePlaceholder {
    return Intl.message(
      '请输入验证码',
      name: 'phoneCodePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `注册账户`
  String get registerUser {
    return Intl.message(
      '注册账户',
      name: 'registerUser',
      desc: '',
      args: [],
    );
  }

  /// `短信登录`
  String get messageLogin {
    return Intl.message(
      '短信登录',
      name: 'messageLogin',
      desc: '',
      args: [],
    );
  }

  /// `密码登录`
  String get passwordLogin {
    return Intl.message(
      '密码登录',
      name: 'passwordLogin',
      desc: '',
      args: [],
    );
  }

  /// `获取验证码`
  String get getCode {
    return Intl.message(
      '获取验证码',
      name: 'getCode',
      desc: '',
      args: [],
    );
  }

  /// `{num}秒后重新获取`
  String getCodeTip(Object num) {
    return Intl.message(
      '$num秒后重新获取',
      name: 'getCodeTip',
      desc: '',
      args: [num],
    );
  }

  /// `忘记密码`
  String get forgetPassword {
    return Intl.message(
      '忘记密码',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `第三方账号登录`
  String get thirdLogin {
    return Intl.message(
      '第三方账号登录',
      name: 'thirdLogin',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get register {
    return Intl.message(
      '注册',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `已经注册？`
  String get hasRegister {
    return Intl.message(
      '已经注册？',
      name: 'hasRegister',
      desc: '',
      args: [],
    );
  }

  /// `注册代表已同意`
  String get registerTip {
    return Intl.message(
      '注册代表已同意',
      name: 'registerTip',
      desc: '',
      args: [],
    );
  }

  /// `《使用条款及隐私政策》`
  String get registerWord {
    return Intl.message(
      '《使用条款及隐私政策》',
      name: 'registerWord',
      desc: '',
      args: [],
    );
  }

  /// `免责声明`
  String get disclaimer {
    return Intl.message(
      '免责声明',
      name: 'disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `提交`
  String get submit {
    return Intl.message(
      '提交',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `编辑`
  String get edit {
    return Intl.message(
      '编辑',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `已购买套餐`
  String get hasBuyCombo {
    return Intl.message(
      '已购买套餐',
      name: 'hasBuyCombo',
      desc: '',
      args: [],
    );
  }

  /// `立即查看`
  String get viewNow {
    return Intl.message(
      '立即查看',
      name: 'viewNow',
      desc: '',
      args: [],
    );
  }

  /// `我的订单`
  String get myOrder {
    return Intl.message(
      '我的订单',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `全部`
  String get all {
    return Intl.message(
      '全部',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `全部订单`
  String get orderStatus1 {
    return Intl.message(
      '全部订单',
      name: 'orderStatus1',
      desc: '',
      args: [],
    );
  }

  /// `待付款`
  String get orderStatus2 {
    return Intl.message(
      '待付款',
      name: 'orderStatus2',
      desc: '',
      args: [],
    );
  }

  /// `待审核`
  String get orderStatus3 {
    return Intl.message(
      '待审核',
      name: 'orderStatus3',
      desc: '',
      args: [],
    );
  }

  /// `已驳回`
  String get orderStatus4 {
    return Intl.message(
      '已驳回',
      name: 'orderStatus4',
      desc: '',
      args: [],
    );
  }

  /// `已购买`
  String get orderStatus5 {
    return Intl.message(
      '已购买',
      name: 'orderStatus5',
      desc: '',
      args: [],
    );
  }

  /// `已完成`
  String get orderStatus6 {
    return Intl.message(
      '已完成',
      name: 'orderStatus6',
      desc: '',
      args: [],
    );
  }

  /// `取消中`
  String get orderStatus7 {
    return Intl.message(
      '取消中',
      name: 'orderStatus7',
      desc: '',
      args: [],
    );
  }

  /// `待服务`
  String get orderStatus8 {
    return Intl.message(
      '待服务',
      name: 'orderStatus8',
      desc: '',
      args: [],
    );
  }

  /// `服务中`
  String get orderStatus9 {
    return Intl.message(
      '服务中',
      name: 'orderStatus9',
      desc: '',
      args: [],
    );
  }

  /// `订单号:`
  String get orderNumber {
    return Intl.message(
      '订单号:',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `¥`
  String get priceUnit {
    return Intl.message(
      '¥',
      name: 'priceUnit',
      desc: '',
      args: [],
    );
  }

  /// `去付款`
  String get goPay {
    return Intl.message(
      '去付款',
      name: 'goPay',
      desc: '',
      args: [],
    );
  }

  /// `联系客服`
  String get contact {
    return Intl.message(
      '联系客服',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `取消订单`
  String get cancelOrder {
    return Intl.message(
      '取消订单',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `预约`
  String get makeAnAppointment {
    return Intl.message(
      '预约',
      name: 'makeAnAppointment',
      desc: '',
      args: [],
    );
  }

  /// `再次购买`
  String get buyAgain {
    return Intl.message(
      '再次购买',
      name: 'buyAgain',
      desc: '',
      args: [],
    );
  }

  /// `订单详情`
  String get orderDetail {
    return Intl.message(
      '订单详情',
      name: 'orderDetail',
      desc: '',
      args: [],
    );
  }

  /// `剩余套餐{num}次 `
  String surplusComboOrder(Object num) {
    return Intl.message(
      '剩余套餐$num次 ',
      name: 'surplusComboOrder',
      desc: '',
      args: [num],
    );
  }

  /// `服务时长`
  String get serviceTime {
    return Intl.message(
      '服务时长',
      name: 'serviceTime',
      desc: '',
      args: [],
    );
  }

  /// `按摩技师`
  String get massagist {
    return Intl.message(
      '按摩技师',
      name: 'massagist',
      desc: '',
      args: [],
    );
  }

  /// `备注`
  String get remark {
    return Intl.message(
      '备注',
      name: 'remark',
      desc: '',
      args: [],
    );
  }

  /// `订单编号`
  String get orderNum {
    return Intl.message(
      '订单编号',
      name: 'orderNum',
      desc: '',
      args: [],
    );
  }

  /// `订单时间`
  String get orderTime {
    return Intl.message(
      '订单时间',
      name: 'orderTime',
      desc: '',
      args: [],
    );
  }

  /// `温馨提示`
  String get tipTile {
    return Intl.message(
      '温馨提示',
      name: 'tipTile',
      desc: '',
      args: [],
    );
  }

  /// `取消购买的配套， 需扣除订单费用的10%作为服务费哦~`
  String get cancelOrderTip {
    return Intl.message(
      '取消购买的配套， 需扣除订单费用的10%作为服务费哦~',
      name: 'cancelOrderTip',
      desc: '',
      args: [],
    );
  }

  /// `确认`
  String get confirm {
    return Intl.message(
      '确认',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `取消`
  String get cancel {
    return Intl.message(
      '取消',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `请选择预约服务地址`
  String get makeAnAppointmentAddress {
    return Intl.message(
      '请选择预约服务地址',
      name: 'makeAnAppointmentAddress',
      desc: '',
      args: [],
    );
  }

  /// `请选择预约服务时间`
  String get makeAnAppointmentTime {
    return Intl.message(
      '请选择预约服务时间',
      name: 'makeAnAppointmentTime',
      desc: '',
      args: [],
    );
  }

  /// `应聘表格`
  String get applicationForm {
    return Intl.message(
      '应聘表格',
      name: 'applicationForm',
      desc: '',
      args: [],
    );
  }

  /// `推广好礼`
  String get promotionGift {
    return Intl.message(
      '推广好礼',
      name: 'promotionGift',
      desc: '',
      args: [],
    );
  }

  /// `我的服务`
  String get myService {
    return Intl.message(
      '我的服务',
      name: 'myService',
      desc: '',
      args: [],
    );
  }

  /// `我的积分`
  String get myPoint {
    return Intl.message(
      '我的积分',
      name: 'myPoint',
      desc: '',
      args: [],
    );
  }

  /// `健康资料`
  String get healthyInfo {
    return Intl.message(
      '健康资料',
      name: 'healthyInfo',
      desc: '',
      args: [],
    );
  }

  /// `我的收益`
  String get myEarnings {
    return Intl.message(
      '我的收益',
      name: 'myEarnings',
      desc: '',
      args: [],
    );
  }

  /// `我的机构`
  String get myOrganization {
    return Intl.message(
      '我的机构',
      name: 'myOrganization',
      desc: '',
      args: [],
    );
  }

  /// `我的评论`
  String get myComments {
    return Intl.message(
      '我的评论',
      name: 'myComments',
      desc: '',
      args: [],
    );
  }

  /// `我的地址`
  String get myAddress {
    return Intl.message(
      '我的地址',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `我的收藏`
  String get myCollection {
    return Intl.message(
      '我的收藏',
      name: 'myCollection',
      desc: '',
      args: [],
    );
  }

  /// `工作台`
  String get workPlatform {
    return Intl.message(
      '工作台',
      name: 'workPlatform',
      desc: '',
      args: [],
    );
  }

  /// `个人资料`
  String get myInfo {
    return Intl.message(
      '个人资料',
      name: 'myInfo',
      desc: '',
      args: [],
    );
  }

  /// `系统设置`
  String get settings {
    return Intl.message(
      '系统设置',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `头像`
  String get avatar {
    return Intl.message(
      '头像',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get ID {
    return Intl.message(
      'ID',
      name: 'ID',
      desc: '',
      args: [],
    );
  }

  /// `电话`
  String get mobile {
    return Intl.message(
      '电话',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `性别`
  String get sex {
    return Intl.message(
      '性别',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `男`
  String get male {
    return Intl.message(
      '男',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `女`
  String get female {
    return Intl.message(
      '女',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get address {
    return Intl.message(
      '地址',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `退出登录`
  String get loginOut {
    return Intl.message(
      '退出登录',
      name: 'loginOut',
      desc: '',
      args: [],
    );
  }

  /// `关于平台`
  String get aboutUs {
    return Intl.message(
      '关于平台',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `隐私协议`
  String get agreement1 {
    return Intl.message(
      '隐私协议',
      name: 'agreement1',
      desc: '',
      args: [],
    );
  }

  /// `用户协议`
  String get agreement2 {
    return Intl.message(
      '用户协议',
      name: 'agreement2',
      desc: '',
      args: [],
    );
  }

  /// `修改密码`
  String get changePassword {
    return Intl.message(
      '修改密码',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `加载失败`
  String get failedText {
    return Intl.message(
      '加载失败',
      name: 'failedText',
      desc: '',
      args: [],
    );
  }

  /// `下拉刷新`
  String get idleText {
    return Intl.message(
      '下拉刷新',
      name: 'idleText',
      desc: '',
      args: [],
    );
  }

  /// `松开刷新`
  String get releaseText {
    return Intl.message(
      '松开刷新',
      name: 'releaseText',
      desc: '',
      args: [],
    );
  }

  /// `刷新中...`
  String get refreshingText {
    return Intl.message(
      '刷新中...',
      name: 'refreshingText',
      desc: '',
      args: [],
    );
  }

  /// `正在刷新...`
  String get completeText {
    return Intl.message(
      '正在刷新...',
      name: 'completeText',
      desc: '',
      args: [],
    );
  }

  /// `松开刷新`
  String get canTwoLevelText {
    return Intl.message(
      '松开刷新',
      name: 'canTwoLevelText',
      desc: '',
      args: [],
    );
  }

  /// `正在加载...`
  String get loadingText {
    return Intl.message(
      '正在加载...',
      name: 'loadingText',
      desc: '',
      args: [],
    );
  }

  /// `暂无数据`
  String get noDataText {
    return Intl.message(
      '暂无数据',
      name: 'noDataText',
      desc: '',
      args: [],
    );
  }

  /// `请选择`
  String get pleaseSelect {
    return Intl.message(
      '请选择',
      name: 'pleaseSelect',
      desc: '',
      args: [],
    );
  }

  /// `兑换明细`
  String get myPointRecord {
    return Intl.message(
      '兑换明细',
      name: 'myPointRecord',
      desc: '',
      args: [],
    );
  }

  /// `全部商品`
  String get allGoods {
    return Intl.message(
      '全部商品',
      name: 'allGoods',
      desc: '',
      args: [],
    );
  }

  /// `优秀按摩师`
  String get goodMassagist {
    return Intl.message(
      '优秀按摩师',
      name: 'goodMassagist',
      desc: '',
      args: [],
    );
  }

  /// `评分`
  String get score {
    return Intl.message(
      '评分',
      name: 'score',
      desc: '',
      args: [],
    );
  }

  /// `评论`
  String get comment {
    return Intl.message(
      '评论',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Lv`
  String get levelAbb {
    return Intl.message(
      'Lv',
      name: 'levelAbb',
      desc: '',
      args: [],
    );
  }

  /// `详情`
  String get detail {
    return Intl.message(
      '详情',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `服务资质`
  String get serviceAbility {
    return Intl.message(
      '服务资质',
      name: 'serviceAbility',
      desc: '',
      args: [],
    );
  }

  /// `温度记录`
  String get temperatureRecord {
    return Intl.message(
      '温度记录',
      name: 'temperatureRecord',
      desc: '',
      args: [],
    );
  }

  /// `产品详情`
  String get goodsDetail {
    return Intl.message(
      '产品详情',
      name: 'goodsDetail',
      desc: '',
      args: [],
    );
  }

  /// `立即购买`
  String get goBuy {
    return Intl.message(
      '立即购买',
      name: 'goBuy',
      desc: '',
      args: [],
    );
  }

  /// `库存`
  String get stock {
    return Intl.message(
      '库存',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `库存{num}件`
  String stockNumUtil(Object num) {
    return Intl.message(
      '库存$num件',
      name: 'stockNumUtil',
      desc: '',
      args: [num],
    );
  }

  /// `选择`
  String get select {
    return Intl.message(
      '选择',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `规格`
  String get specs {
    return Intl.message(
      '规格',
      name: 'specs',
      desc: '',
      args: [],
    );
  }

  /// `取消政策`
  String get cancelRule {
    return Intl.message(
      '取消政策',
      name: 'cancelRule',
      desc: '',
      args: [],
    );
  }

  /// `取消收取{num}手续费`
  String cancelRuleTip(Object num) {
    return Intl.message(
      '取消收取$num手续费',
      name: 'cancelRuleTip',
      desc: '',
      args: [num],
    );
  }

  /// `套餐次数`
  String get numberOfCombo {
    return Intl.message(
      '套餐次数',
      name: 'numberOfCombo',
      desc: '',
      args: [],
    );
  }

  /// `优惠券`
  String get coupons {
    return Intl.message(
      '优惠券',
      name: 'coupons',
      desc: '',
      args: [],
    );
  }

  /// `订单备注`
  String get orderRemark {
    return Intl.message(
      '订单备注',
      name: 'orderRemark',
      desc: '',
      args: [],
    );
  }

  /// `共{num}件`
  String numberOfGoods(Object num) {
    return Intl.message(
      '共$num件',
      name: 'numberOfGoods',
      desc: '',
      args: [num],
    );
  }

  /// `小计`
  String get subtotal {
    return Intl.message(
      '小计',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `提交订单`
  String get submitOrder {
    return Intl.message(
      '提交订单',
      name: 'submitOrder',
      desc: '',
      args: [],
    );
  }

  /// `上传凭证`
  String get uploadOrderResult {
    return Intl.message(
      '上传凭证',
      name: 'uploadOrderResult',
      desc: '',
      args: [],
    );
  }

  /// `提交凭证`
  String get submitOrderResult {
    return Intl.message(
      '提交凭证',
      name: 'submitOrderResult',
      desc: '',
      args: [],
    );
  }

  /// `支付账户`
  String get payAccount {
    return Intl.message(
      '支付账户',
      name: 'payAccount',
      desc: '',
      args: [],
    );
  }

  /// `支付卡号`
  String get payNumber {
    return Intl.message(
      '支付卡号',
      name: 'payNumber',
      desc: '',
      args: [],
    );
  }

  /// `付款人姓名`
  String get payeeAccount {
    return Intl.message(
      '付款人姓名',
      name: 'payeeAccount',
      desc: '',
      args: [],
    );
  }

  /// `付款人卡号`
  String get payeeNumber {
    return Intl.message(
      '付款人卡号',
      name: 'payeeNumber',
      desc: '',
      args: [],
    );
  }

  /// `剩余{num}次`
  String numberOfLeft(Object num) {
    return Intl.message(
      '剩余$num次',
      name: 'numberOfLeft',
      desc: '',
      args: [num],
    );
  }

  /// `投诉举报`
  String get complain {
    return Intl.message(
      '投诉举报',
      name: 'complain',
      desc: '',
      args: [],
    );
  }

  /// `确认完成`
  String get finish {
    return Intl.message(
      '确认完成',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `去评价`
  String get goComment {
    return Intl.message(
      '去评价',
      name: 'goComment',
      desc: '',
      args: [],
    );
  }

  /// `查看详情`
  String get showDetail {
    return Intl.message(
      '查看详情',
      name: 'showDetail',
      desc: '',
      args: [],
    );
  }

  /// `取消预约`
  String get cancelAppointment {
    return Intl.message(
      '取消预约',
      name: 'cancelAppointment',
      desc: '',
      args: [],
    );
  }

  /// `订单评价`
  String get orderComment {
    return Intl.message(
      '订单评价',
      name: 'orderComment',
      desc: '',
      args: [],
    );
  }

  /// `请填写订单评论，这里是订单评论~`
  String get commentTip {
    return Intl.message(
      '请填写订单评论，这里是订单评论~',
      name: 'commentTip',
      desc: '',
      args: [],
    );
  }

  /// `订单评分`
  String get orderScore {
    return Intl.message(
      '订单评分',
      name: 'orderScore',
      desc: '',
      args: [],
    );
  }

  /// `服务`
  String get service {
    return Intl.message(
      '服务',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `守时`
  String get keepTime {
    return Intl.message(
      '守时',
      name: 'keepTime',
      desc: '',
      args: [],
    );
  }

  /// `技能`
  String get ability {
    return Intl.message(
      '技能',
      name: 'ability',
      desc: '',
      args: [],
    );
  }

  /// `形象`
  String get appearance {
    return Intl.message(
      '形象',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `清洁度`
  String get cleanScore {
    return Intl.message(
      '清洁度',
      name: 'cleanScore',
      desc: '',
      args: [],
    );
  }

  /// `请填写内容~`
  String get pleaseInputContent {
    return Intl.message(
      '请填写内容~',
      name: 'pleaseInputContent',
      desc: '',
      args: [],
    );
  }

  /// `消息提醒`
  String get messageTip {
    return Intl.message(
      '消息提醒',
      name: 'messageTip',
      desc: '',
      args: [],
    );
  }

  /// `系统通知`
  String get systemNotice {
    return Intl.message(
      '系统通知',
      name: 'systemNotice',
      desc: '',
      args: [],
    );
  }

  /// `分享好友`
  String get shareFriend {
    return Intl.message(
      '分享好友',
      name: 'shareFriend',
      desc: '',
      args: [],
    );
  }

  /// `新人优惠券，当TA首次下单后`
  String get shareFriendTip1 {
    return Intl.message(
      '新人优惠券，当TA首次下单后',
      name: 'shareFriendTip1',
      desc: '',
      args: [],
    );
  }

  /// `您可以获得`
  String get shareFriendTip2 {
    return Intl.message(
      '您可以获得',
      name: 'shareFriendTip2',
      desc: '',
      args: [],
    );
  }

  /// `奖励`
  String get shareFriendTip3 {
    return Intl.message(
      '奖励',
      name: 'shareFriendTip3',
      desc: '',
      args: [],
    );
  }

  /// `我的优惠券`
  String get myCoupons {
    return Intl.message(
      '我的优惠券',
      name: 'myCoupons',
      desc: '',
      args: [],
    );
  }

  /// `我的邀请码`
  String get myInviteCode {
    return Intl.message(
      '我的邀请码',
      name: 'myInviteCode',
      desc: '',
      args: [],
    );
  }

  /// `保存`
  String get save {
    return Intl.message(
      '保存',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `邀请码`
  String get inviteCode {
    return Intl.message(
      '邀请码',
      name: 'inviteCode',
      desc: '',
      args: [],
    );
  }

  /// `点击复制`
  String get clickCopy {
    return Intl.message(
      '点击复制',
      name: 'clickCopy',
      desc: '',
      args: [],
    );
  }

  /// `立即使用`
  String get useStatus {
    return Intl.message(
      '立即使用',
      name: 'useStatus',
      desc: '',
      args: [],
    );
  }

  /// `已使用`
  String get used {
    return Intl.message(
      '已使用',
      name: 'used',
      desc: '',
      args: [],
    );
  }

  /// `已过期`
  String get useOver {
    return Intl.message(
      '已过期',
      name: 'useOver',
      desc: '',
      args: [],
    );
  }

  /// `满{num}可用`
  String couponsUseTip(Object num) {
    return Intl.message(
      '满$num可用',
      name: 'couponsUseTip',
      desc: '',
      args: [num],
    );
  }

  /// `有效期至`
  String get canUseDate {
    return Intl.message(
      '有效期至',
      name: 'canUseDate',
      desc: '',
      args: [],
    );
  }

  /// `积分`
  String get point {
    return Intl.message(
      '积分',
      name: 'point',
      desc: '',
      args: [],
    );
  }

  /// `已兑{num}件`
  String numberOfChange(Object num) {
    return Intl.message(
      '已兑$num件',
      name: 'numberOfChange',
      desc: '',
      args: [num],
    );
  }

  /// `使用规则`
  String get useRule {
    return Intl.message(
      '使用规则',
      name: 'useRule',
      desc: '',
      args: [],
    );
  }

  /// `立即兑换`
  String get changePoint {
    return Intl.message(
      '立即兑换',
      name: 'changePoint',
      desc: '',
      args: [],
    );
  }

  /// `确认订单`
  String get confirmOrder {
    return Intl.message(
      '确认订单',
      name: 'confirmOrder',
      desc: '',
      args: [],
    );
  }

  /// `兑换结果`
  String get pointChangeResult {
    return Intl.message(
      '兑换结果',
      name: 'pointChangeResult',
      desc: '',
      args: [],
    );
  }

  /// `收货人`
  String get receiver {
    return Intl.message(
      '收货人',
      name: 'receiver',
      desc: '',
      args: [],
    );
  }

  /// `收货地址`
  String get receiverAddress {
    return Intl.message(
      '收货地址',
      name: 'receiverAddress',
      desc: '',
      args: [],
    );
  }

  /// `会员积分`
  String get memberPoint {
    return Intl.message(
      '会员积分',
      name: 'memberPoint',
      desc: '',
      args: [],
    );
  }

  /// `兑换时间`
  String get exchangeTime {
    return Intl.message(
      '兑换时间',
      name: 'exchangeTime',
      desc: '',
      args: [],
    );
  }

  /// `兑换订单号`
  String get exchangeOrderNumber {
    return Intl.message(
      '兑换订单号',
      name: 'exchangeOrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `总收益数`
  String get allEarnings {
    return Intl.message(
      '总收益数',
      name: 'allEarnings',
      desc: '',
      args: [],
    );
  }

  /// `可提现收益数`
  String get canExchangeEarnings {
    return Intl.message(
      '可提现收益数',
      name: 'canExchangeEarnings',
      desc: '',
      args: [],
    );
  }

  /// `提现记录`
  String get exchangeRecord {
    return Intl.message(
      '提现记录',
      name: 'exchangeRecord',
      desc: '',
      args: [],
    );
  }

  /// `输入要提现的收益数`
  String get inputWillExchangeNumber {
    return Intl.message(
      '输入要提现的收益数',
      name: 'inputWillExchangeNumber',
      desc: '',
      args: [],
    );
  }

  /// `可到账金额`
  String get canGetMoney {
    return Intl.message(
      '可到账金额',
      name: 'canGetMoney',
      desc: '',
      args: [],
    );
  }

  /// `请选择账户`
  String get pleaseSelectAccount {
    return Intl.message(
      '请选择账户',
      name: 'pleaseSelectAccount',
      desc: '',
      args: [],
    );
  }

  /// `立即提现`
  String get exchangeCash {
    return Intl.message(
      '立即提现',
      name: 'exchangeCash',
      desc: '',
      args: [],
    );
  }

  /// `我的账号`
  String get myAccount {
    return Intl.message(
      '我的账号',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `添加`
  String get add {
    return Intl.message(
      '添加',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `删除`
  String get delete {
    return Intl.message(
      '删除',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `默认`
  String get defaultText {
    return Intl.message(
      '默认',
      name: 'defaultText',
      desc: '',
      args: [],
    );
  }

  /// `添加账号`
  String get addAccount {
    return Intl.message(
      '添加账号',
      name: 'addAccount',
      desc: '',
      args: [],
    );
  }

  /// `姓名`
  String get name {
    return Intl.message(
      '姓名',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `银行卡号`
  String get bankCard {
    return Intl.message(
      '银行卡号',
      name: 'bankCard',
      desc: '',
      args: [],
    );
  }

  /// `所属银行`
  String get bankName {
    return Intl.message(
      '所属银行',
      name: 'bankName',
      desc: '',
      args: [],
    );
  }

  /// `设为默认`
  String get setDefault {
    return Intl.message(
      '设为默认',
      name: 'setDefault',
      desc: '',
      args: [],
    );
  }

  /// `所在区域`
  String get area {
    return Intl.message(
      '所在区域',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `详细地址`
  String get detailAddress {
    return Intl.message(
      '详细地址',
      name: 'detailAddress',
      desc: '',
      args: [],
    );
  }

  /// `分销用户(人)`
  String get orgMember {
    return Intl.message(
      '分销用户(人)',
      name: 'orgMember',
      desc: '',
      args: [],
    );
  }

  /// `累计佣金`
  String get orgEarnings {
    return Intl.message(
      '累计佣金',
      name: 'orgEarnings',
      desc: '',
      args: [],
    );
  }

  /// `机构入驻`
  String get orgApply {
    return Intl.message(
      '机构入驻',
      name: 'orgApply',
      desc: '',
      args: [],
    );
  }

  /// `为保证您的利益，请如实填写以下信息`
  String get orgApplyTip {
    return Intl.message(
      '为保证您的利益，请如实填写以下信息',
      name: 'orgApplyTip',
      desc: '',
      args: [],
    );
  }

  /// `机构名称`
  String get orgName {
    return Intl.message(
      '机构名称',
      name: 'orgName',
      desc: '',
      args: [],
    );
  }

  /// `机构负责人`
  String get orgLeader {
    return Intl.message(
      '机构负责人',
      name: 'orgLeader',
      desc: '',
      args: [],
    );
  }

  /// `联系方式`
  String get contactWay {
    return Intl.message(
      '联系方式',
      name: 'contactWay',
      desc: '',
      args: [],
    );
  }

  /// `资料附件`
  String get infoExtra {
    return Intl.message(
      '资料附件',
      name: 'infoExtra',
      desc: '',
      args: [],
    );
  }

  /// `附件下载`
  String get extraDownload {
    return Intl.message(
      '附件下载',
      name: 'extraDownload',
      desc: '',
      args: [],
    );
  }

  /// `负责人身份证正反面照`
  String get leaderIdCard {
    return Intl.message(
      '负责人身份证正反面照',
      name: 'leaderIdCard',
      desc: '',
      args: [],
    );
  }

  /// `正面照片`
  String get idCardFont {
    return Intl.message(
      '正面照片',
      name: 'idCardFont',
      desc: '',
      args: [],
    );
  }

  /// `反面照片`
  String get idCardBack {
    return Intl.message(
      '反面照片',
      name: 'idCardBack',
      desc: '',
      args: [],
    );
  }

  /// `营业执照（选填）`
  String get license {
    return Intl.message(
      '营业执照（选填）',
      name: 'license',
      desc: '',
      args: [],
    );
  }

  /// `我知道了`
  String get know {
    return Intl.message(
      '我知道了',
      name: 'know',
      desc: '',
      args: [],
    );
  }

  /// `资料提交成功， 结果将在1-2工作日反馈！`
  String get formFinishTip {
    return Intl.message(
      '资料提交成功， 结果将在1-2工作日反馈！',
      name: 'formFinishTip',
      desc: '',
      args: [],
    );
  }

  /// `点击提交，即表示您已同意`
  String get bottomTip {
    return Intl.message(
      '点击提交，即表示您已同意',
      name: 'bottomTip',
      desc: '',
      args: [],
    );
  }

  /// `《机构入驻协议》`
  String get orgBottomWord {
    return Intl.message(
      '《机构入驻协议》',
      name: 'orgBottomWord',
      desc: '',
      args: [],
    );
  }

  /// `删除评论`
  String get cancelComment {
    return Intl.message(
      '删除评论',
      name: 'cancelComment',
      desc: '',
      args: [],
    );
  }

  /// `《健康资料协议》`
  String get healthBottomWord {
    return Intl.message(
      '《健康资料协议》',
      name: 'healthBottomWord',
      desc: '',
      args: [],
    );
  }

  /// `接单大厅`
  String get serviceOrderRoom {
    return Intl.message(
      '接单大厅',
      name: 'serviceOrderRoom',
      desc: '',
      args: [],
    );
  }

  /// `我的库存`
  String get myWareHouse {
    return Intl.message(
      '我的库存',
      name: 'myWareHouse',
      desc: '',
      args: [],
    );
  }

  /// `身体状况`
  String get bodyStatus {
    return Intl.message(
      '身体状况',
      name: 'bodyStatus',
      desc: '',
      args: [],
    );
  }

  /// `个人设置`
  String get personalSettings {
    return Intl.message(
      '个人设置',
      name: 'personalSettings',
      desc: '',
      args: [],
    );
  }

  /// `待服务订单`
  String get workplaceWaitServiceOrder {
    return Intl.message(
      '待服务订单',
      name: 'workplaceWaitServiceOrder',
      desc: '',
      args: [],
    );
  }

  /// `查看全部`
  String get showAll {
    return Intl.message(
      '查看全部',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `预约信息`
  String get appointmentInfo {
    return Intl.message(
      '预约信息',
      name: 'appointmentInfo',
      desc: '',
      args: [],
    );
  }

  /// `预约时间`
  String get appointmentTime {
    return Intl.message(
      '预约时间',
      name: 'appointmentTime',
      desc: '',
      args: [],
    );
  }

  /// `预约佣金`
  String get appointmentMoney {
    return Intl.message(
      '预约佣金',
      name: 'appointmentMoney',
      desc: '',
      args: [],
    );
  }

  /// `上门地址`
  String get appointmentAddress {
    return Intl.message(
      '上门地址',
      name: 'appointmentAddress',
      desc: '',
      args: [],
    );
  }

  /// `配套升级`
  String get upComboLevel {
    return Intl.message(
      '配套升级',
      name: 'upComboLevel',
      desc: '',
      args: [],
    );
  }

  /// `开始按摩`
  String get startMassage {
    return Intl.message(
      '开始按摩',
      name: 'startMassage',
      desc: '',
      args: [],
    );
  }

  /// `拒绝接单`
  String get refuseOrder {
    return Intl.message(
      '拒绝接单',
      name: 'refuseOrder',
      desc: '',
      args: [],
    );
  }

  /// `确认接单`
  String get receiveOrder {
    return Intl.message(
      '确认接单',
      name: 'receiveOrder',
      desc: '',
      args: [],
    );
  }

  /// `填写备注`
  String get inputRemark {
    return Intl.message(
      '填写备注',
      name: 'inputRemark',
      desc: '',
      args: [],
    );
  }

  /// `总时长`
  String get totalTime {
    return Intl.message(
      '总时长',
      name: 'totalTime',
      desc: '',
      args: [],
    );
  }

  /// `温馨提示：按摩师48h内需要把钱送达财务确认哦~`
  String get serviceOrderTip {
    return Intl.message(
      '温馨提示：按摩师48h内需要把钱送达财务确认哦~',
      name: 'serviceOrderTip',
      desc: '',
      args: [],
    );
  }

  /// `订单已完成`
  String get orderFinished {
    return Intl.message(
      '订单已完成',
      name: 'orderFinished',
      desc: '',
      args: [],
    );
  }

  /// `我要补货`
  String get goToAddEquipment {
    return Intl.message(
      '我要补货',
      name: 'goToAddEquipment',
      desc: '',
      args: [],
    );
  }

  /// `库存明细`
  String get equipmentRecord {
    return Intl.message(
      '库存明细',
      name: 'equipmentRecord',
      desc: '',
      args: [],
    );
  }

  /// `消耗记录`
  String get equipmentUsedRecord {
    return Intl.message(
      '消耗记录',
      name: 'equipmentUsedRecord',
      desc: '',
      args: [],
    );
  }

  /// `补货记录`
  String get equipmentAddedRecord {
    return Intl.message(
      '补货记录',
      name: 'equipmentAddedRecord',
      desc: '',
      args: [],
    );
  }

  /// `添加库存`
  String get addEquipment {
    return Intl.message(
      '添加库存',
      name: 'addEquipment',
      desc: '',
      args: [],
    );
  }

  /// `所有照片`
  String get allPicture {
    return Intl.message(
      '所有照片',
      name: 'allPicture',
      desc: '',
      args: [],
    );
  }

  /// `没有选择照片`
  String get notSelectedPicture {
    return Intl.message(
      '没有选择照片',
      name: 'notSelectedPicture',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}