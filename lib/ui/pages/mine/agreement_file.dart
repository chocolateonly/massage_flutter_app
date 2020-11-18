import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:flutter_html/flutter_html.dart';
class AgreementFilePage extends StatelessWidget {
  var type=0;

  var title='';

  AgreementFilePage(this.type,this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Html(
          padding: EdgeInsets.symmetric(horizontal: 20.rpx),
          data: 'data${this.title}',
        ),
      ),
    );
  }
}
