import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:flutter_html/flutter_html.dart';

class ApplyWordPage extends StatelessWidget {
  var title;
  var type;
  ApplyWordPage(this.title,this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          padding: EdgeInsets.symmetric(horizontal: 20.rpx),
          data: 'data',
        ),
      ),
    );
  }
}
