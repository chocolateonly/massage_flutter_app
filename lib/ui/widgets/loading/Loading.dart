import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class Loading extends StatelessWidget {
  var text="正在加载中...";

  Loading(this.text);
  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: 280,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),//加载动画
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text(text!=''?text:S.of(context).loadingText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
