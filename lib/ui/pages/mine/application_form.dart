import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class ApplicationFormPage extends StatefulWidget {

  @override
  _ApplicationFormPageState createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).applicationForm),
      ),
      body: Container(

      ),
    );
  }
}
