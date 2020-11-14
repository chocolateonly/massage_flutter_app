import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  int _newValue=StorageManager.sharedPreferences.getInt(LocaleModel.kLocaleIndex) ?? 0;
  @override
  Widget build(BuildContext context) {
    var localModelData=Provider.of<LocaleModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).language),
      ),
      body: ListView.builder( //遍历对应v-for
        shrinkWrap: true,
        itemCount: LocaleModel.localeValueList.length,
        itemBuilder: (context,index){
          return Column(
            children: <Widget>[
              RadioListTile(
                value: index,
                title: Text(LocaleModel.localeName(index,context)),
                groupValue: _newValue,
                onChanged: (index) {
                  setState(() {
                    print(index);
                    _newValue = index;
                  });
                  localModelData.switchLocale(index);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
