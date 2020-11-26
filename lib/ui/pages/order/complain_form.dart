import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';

class ComplainFormPage extends StatefulWidget {
  var title, type;

  ComplainFormPage(this.title, this.type);

  @override
  _ComplainFormPageState createState() => _ComplainFormPageState();
}

class _ComplainFormPageState extends State<ComplainFormPage> {
  var comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.rpx)),
                  child: Container(
                      padding: EdgeInsets.all(20.rpx),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
//                   评价
                          TextField(
                            controller: comment,
                            maxLines: 5,
                            minLines: 5,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(fontSize: 26.rpx),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '请填写内容~',
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              ThemeButton(title: S.of(context).submit, onPressed: () {

              })
            ],
          ),
        ),
      ),
    );
  }
}
