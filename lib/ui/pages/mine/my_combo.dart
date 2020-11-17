import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyComboPage extends StatefulWidget {

  @override
  _MyComboPageState createState() => _MyComboPageState();
}

class _MyComboPageState extends State<MyComboPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).hasBuyCombo),
      ),
      body: Container(

      ),
    );
  }
}
