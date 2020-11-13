import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的tab index 页面'),
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
          setState(() {
          _selectedIndex = index;
          });
        },
      ),
    );
  }
}
