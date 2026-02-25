//底部导航代码
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Cart/Index.dart';
import 'package:flutter_application_1/pages/Categary/Index.dart';
import 'package:flutter_application_1/pages/Home/Index.dart';
import 'package:flutter_application_1/pages/Mine/Index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // 定义数据 根据数据进行渲染4个导航
  // 一般应用程序的导航是固定的final
  final List<Map<String, String>> _tabList = [
    {
      "icon": "lib/assets/ic_public_home_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_home_active.png", // 激活显示的图标
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_pro_active.png", // 激活显示的图标
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_cart_active.png", // 激活显示的图标
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png", // 正常显示的图标
      "active_icon": "lib/assets/ic_public_my_active.png", // 激活显示的图标
      "text": "我的",
    },
  ];
  //声明底部导航栏变量
  int _currentIndex = 0;

  // 返回底部渲染的四个分类
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_tabList.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(
          _tabList[index]["icon"]!,
          width: 30,
          height: 30,
        ), // 正常显示图标
        // 激活图标
        activeIcon: Image.asset(
          _tabList[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _tabList[index]["text"],
      );
    });
  }

  //返回函数组件，4个页面跳转数据返回-------------*
  List<Widget> _getChildren() {
    // return [Text("首页"), Text("分类"), Text("购物车"), Text("我的")]; //测试写死的
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("我的app")),

      //设置底部导航栏
      body: IndexedStack(
        index: _currentIndex, //索引变量
        children: _getChildren(), // 放置几个组件
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red, //设置底部导航栏点击颜色
        unselectedItemColor: Colors.black, //设置底部导航栏默认颜色
        showUnselectedLabels: true, //设置底部导航栏默认颜色开关，必须为true
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}
