import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyPointPage extends StatefulWidget {

  @override
  _MyPointPageState createState() => _MyPointPageState();
}

class _MyPointPageState extends State<MyPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myPoint),
      ),
      body: Container(

      ),
    );
  }
}
