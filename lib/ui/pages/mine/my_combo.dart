import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'my_order_list.dart';
class MyComboPage extends StatefulWidget {

  @override
  _MyComboPageState createState() => _MyComboPageState();
}

class _MyComboPageState extends State<MyComboPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).hasBuyCombo),
      ),
      body: OrderListContent(3),
    );
  }
}
