import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/pages/home/home.dart';
import 'package:massageflutterapp/ui/pages/order/order.dart';
import 'package:massageflutterapp/ui/pages/message/message.dart';
import 'package:massageflutterapp/ui/pages/mine/mine.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> with WidgetsBindingObserver{
  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;
  List<Widget> pages = <Widget>[HomePage(), OrderPage(), MessagePag(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope( //处理是否离开当前页面
        onWillPop: () async {
          if(_lastPressed==null || DateTime.now().difference(_lastPressed) > Duration(seconds: 1)){
            //两次点击间隔超过1秒则重新计时
            _lastPressed=DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
            itemBuilder: (ctx,index)=>pages[index],
            itemCount: pages.length,
            controller:_pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index){
              print('当前页:');
              print( index);
              setState(() {
                _selectedIndex = index;
              });
            },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20.px,height:20.px),
              title: Text(S.of(context).tab1),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_true.png"), color: Theme.of(context).accentColor, height: 20.px, width: 20.px)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab2.png"),width:20.px,height:20.px),
              title: Text(S.of(context).tab2),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab2_true.png"), color: Theme.of(context).accentColor, height: 20.px, width: 20.px)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20.px,height:20.px),
              title: Text(S.of(context).tab3),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_true.png"), color: Theme.of(context).accentColor, height: 20.px, width: 20.px)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20.px,height:20.px),
              title: Text(S.of(context).tab4),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_true.png"), color: Theme.of(context).accentColor, height: 20.px, width: 20.px)
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index){
          print(index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
