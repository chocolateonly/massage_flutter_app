import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/pages/home/home.dart';
import 'package:massageflutterapp/ui/pages/order/order.dart';
import 'package:massageflutterapp/ui/pages/message/message.dart';
import 'package:massageflutterapp/ui/pages/mine/mine.dart';
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
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20,height:20),
              title: Text('首页'),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_true.png"), color: Theme.of(context).accentColor, height: 20, width: 20)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab2.png"),width:20,height:20),
              title: Text('订单'),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab2_true.png"), color: Theme.of(context).accentColor, height: 20, width: 20)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20,height:20),
              title: Text('消息'),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_true.png"), color: Theme.of(context).accentColor, height: 20, width: 20)
          ),
          BottomNavigationBarItem(
              icon:Image.asset(ImageHelper.wrapAssets("icon_tab1.png"),width:20,height:20),
              title: Text('我的'),
              activeIcon: Image.asset(ImageHelper.wrapAssets("icon_tab1_true.png"), color: Theme.of(context).accentColor, height: 20, width: 20)
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
