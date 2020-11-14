import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var langIndex=StorageManager.sharedPreferences.getInt(LocaleModel.kLocaleIndex) ?? 0;
    var _newValue = langIndex.toString();
    var localModelData=Provider.of<LocaleModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
       // backgroundColor: ,
        title: Text(S.of(context).homeTitle),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Flexible(
              child: RadioListTile<String>(
                value: '0',
                title: Text(localModelData.localeName(0,context)),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    print(_newValue);
                    _newValue = value;
                  });
                  localModelData.switchLocale(0);
                },
              ),
            ),
            Flexible(
              child: RadioListTile<String>(
                value: '1',
                title: Text(localModelData.localeName(1,context)),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                  localModelData.switchLocale(1);
                },
              ),
            ),
            Flexible(
              child: RadioListTile<String>(
                value: '2',
                title: Text(localModelData.localeName(2,context)),
                groupValue: _newValue,
                onChanged: (value) {
                  setState(() {
                    _newValue = value;
                  });
                  localModelData.switchLocale(2);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
