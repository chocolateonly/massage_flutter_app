import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyCommentsPage extends StatefulWidget {

  @override
  _MyCommentsPageState createState() => _MyCommentsPageState();
}

class _MyCommentsPageState extends State<MyCommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myComments),
      ),
      body: Container(

      ),
    );
  }
}
