import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
