import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyCollectionPage extends StatefulWidget {

  @override
  _MyCollectionPageState createState() => _MyCollectionPageState();
}

class _MyCollectionPageState extends State<MyCollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myCollection),
      ),
      body: Container(

      ),
    );
  }
}
