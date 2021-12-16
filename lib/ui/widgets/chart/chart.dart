import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:trading_chart/flutter_k_chart.dart';
import 'package:trading_chart/k_chart_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<KLineEntity> datas;
  bool showLoading = true;
  MainState _mainState = MainState.NONE;
  SecondaryState _secondaryState = SecondaryState.NONE;
  bool isLine = false;
  bool isChinese = true;
  List<DepthEntity> _bids, _asks;

  @override
  void initState() {
    super.initState();
    getData('1day');
    rootBundle.loadString('assets/depth.json').then((result) {
      final parseJson = json.decode(result);
      Map tick = parseJson['tick'];
      var bids = tick['bids']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      var asks = tick['asks']
          .map((item) => DepthEntity(item[0], item[1]))
          .toList()
          .cast<DepthEntity>();
      initDepth(bids, asks);
    });
  }

  void initDepth(List<DepthEntity> bids, List<DepthEntity> asks) {
    if (bids == null || asks == null || bids.isEmpty || asks.isEmpty) return;
    _bids = List();
    _asks = List();
    double amount = 0.0;
    bids?.sort((left, right) => left.price.compareTo(right.price));
    //累加买入委托量
    bids.reversed.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _bids.insert(0, item);
    });

    amount = 0.0;
    asks?.sort((left, right) => left.price.compareTo(right.price));
    //累加卖出委托量
    asks?.forEach((item) {
      amount += item.vol;
      item.vol = amount;
      _asks.add(item);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff17212F),
      body: ListView(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: 450,
              width: double.infinity,
              child: KChartWidget(
                datas,
                isLine: isLine,
                mainState: _mainState,
                secondaryState: _secondaryState,
                fixedLength: 2,
                timeFormat: TimeFormat.YEAR_MONTH_DAY,
                isChinese: false,
                bgColor: [
                  Color(0xFF121128),
                  Color(0xFF121128),
                  Color(0xFF121128)
                ],
              ),
            ),
            if (showLoading)
              Container(
                  width: double.infinity,
                  height: 450,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()),
          ]),
          buildButtons(),
          Container(
            height: 230,
            width: double.infinity,
            child: DepthChart(_bids, _asks),
          )
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Column(
      children: [
        Wrap(
          runSpacing: 6.0,
          spacing: 6.0,
          alignment: WrapAlignment.center,
          children: [
            button(
              "Line",
              onPressed: () => isLine = true,
              selected: isLine,
            ),
            button(
              "Bars",
              onPressed: () => isLine = false,
              selected: !isLine,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 6.0,
          ),
        ),
        Wrap(
          runSpacing: 6.0,
          spacing: 6.0,
          alignment: WrapAlignment.center,
          children: [
            button(
              "MACD",
              onPressed: () => _secondaryState = SecondaryState.MACD,
              selected: _mainState == MainState.MA,
            ),
            button(
              "KDJ",
              onPressed: () => _secondaryState = SecondaryState.KDJ,
              selected: _secondaryState == SecondaryState.KDJ,
            ),
            button(
              "RSI",
              onPressed: () => _secondaryState = SecondaryState.RSI,
              selected: _secondaryState == SecondaryState.RSI,
            ),
            button(
              "WR",
              onPressed: () => _secondaryState = SecondaryState.WR,
              selected: _secondaryState == SecondaryState.WR,
            ),
            button(
              "NONE",
              onPressed: () => _secondaryState = SecondaryState.NONE,
              selected: _secondaryState == SecondaryState.NONE,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 6.0,
          ),
        ),
        Wrap(
          runSpacing: 6.0,
          spacing: 6.0,
          alignment: WrapAlignment.center,
          children: [
            button(
              "MA",
              onPressed: () => _mainState = MainState.MA,
              selected: _mainState == MainState.MA,
            ),
            button(
              "BOLL",
              onPressed: () => _mainState = MainState.BOLL,
              selected: _mainState == MainState.BOLL,
            ),
            button(
              "NONE",
              onPressed: () => _mainState = MainState.NONE,
              selected: _mainState == MainState.NONE,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 6.0,
          ),
        ),
        Wrap(
          runSpacing: 6.0,
          spacing: 6.0,
          alignment: WrapAlignment.center,
          children: [
            button(
              isChinese ? "ZH" : 'EN',
              onPressed: () => isChinese = !isChinese,
              selected: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget button(String text, {VoidCallback onPressed, bool selected = false}) {
    return SizedBox(
      width: 50.0,
      height: 30.0,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          if (onPressed != null) {
            onPressed();
            setState(() {});
          }
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        color: selected ? Colors.blue : Colors.blue.withOpacity(0.6),
      ),
    );
  }

  void getData(String period) {
    Future<String> future = getIPAddress('$period');
    future.then((result) {
      Map parseJson = json.decode(result);
      List list = parseJson['data'];
      datas = list
          .map((item) => KLineEntity.fromJson(item))
          .toList()
          .reversed
          .toList()
          .cast<KLineEntity>();
      DataUtil.calculate(datas);
      showLoading = false;
      setState(() {});
    }).catchError((_) {
      showLoading = false;
      setState(() {});
      print('获取数据失败');
    });
  }

  //获取火币数据，需要翻墙
  Future<String> getIPAddress(String period) async {
    var url =
        'https://api.huobi.br.com/market/history/kline?period=${period ?? '1day'}&size=300&symbol=btcusdt';
    String result;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      result = response.body;
    } else {
      print('Failed getting IP address');
    }
    return result;
  }
}