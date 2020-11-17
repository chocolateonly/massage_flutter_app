import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyOrderListPage extends StatefulWidget {
  var type=0;//订单状态

  MyOrderListPage(this.type);

  @override
  _MyOrderListPageState createState() => _MyOrderListPageState();
}

class _MyOrderListPageState extends State<MyOrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myOrder),
      ),
      body: Container(

      ),
    );
  }
}
