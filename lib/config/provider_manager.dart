import 'package:massageflutterapp/view_model/global_model.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:massageflutterapp/view_model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<GlobalModel>(
      create:(context) => GlobalModel(1)
  ),
  ChangeNotifierProvider<UserModel>(
      create:(context) =>UserModel()
  ),
  ChangeNotifierProvider<LocaleModel>(
      create:(context) =>LocaleModel()
  )
];
