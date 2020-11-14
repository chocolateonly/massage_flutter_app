import 'package:massageflutterapp/view_model/global_model.dart';
import 'package:massageflutterapp/view_model/home_model.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:massageflutterapp/view_model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<GlobalModel>(
      create:(context) => GlobalModel()
  ),
  ChangeNotifierProvider<LocaleModel>(
      create:(context) =>LocaleModel()
  ),
  ChangeNotifierProvider<UserModel>(
      create:(context) =>UserModel()
  ),
  ChangeNotifierProvider<HomeModel>(
    create: (context)=>HomeModel(),
  )
];
