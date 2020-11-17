import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyEarningsPage extends StatefulWidget {

  @override
  _MyEarningsPageState createState() => _MyEarningsPageState();
}

class _MyEarningsPageState extends State<MyEarningsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myEarnings),
      ),
      body: Container(

      ),
    );
  }
}
