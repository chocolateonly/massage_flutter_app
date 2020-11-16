import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:flutter_html/flutter_html.dart';
class RegisterWordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).registerWord),
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
