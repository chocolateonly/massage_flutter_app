import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class HealthyInfoPage extends StatefulWidget {

  @override
  _HealthyInfoPageState createState() => _HealthyInfoPageState();
}

class _HealthyInfoPageState extends State<HealthyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).healthyInfo),
      ),
      body: Container(

      ),
    );
  }
}
