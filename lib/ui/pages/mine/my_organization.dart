import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MyOrganizationPage extends StatefulWidget {

  @override
  _MyOrganizationPageState createState() => _MyOrganizationPageState();
}

class _MyOrganizationPageState extends State<MyOrganizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myOrganization),
      ),
      body: Container(

      ),
    );
  }
}
