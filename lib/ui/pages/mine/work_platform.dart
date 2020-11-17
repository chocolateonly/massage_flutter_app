import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class WorkPlatformPage extends StatefulWidget {

  @override
  _WorkPlatformPageState createState() => _WorkPlatformPageState();
}

class _WorkPlatformPageState extends State<WorkPlatformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).workPlatform),
      ),
      body: Container(

      ),
    );
  }
}
