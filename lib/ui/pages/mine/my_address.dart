import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyAddressPage extends StatefulWidget {

  @override
  _MyAddressPageState createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myAddress),
      ),
      body: Container(

      ),
    );
  }
}
