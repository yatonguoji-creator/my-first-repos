// 管理路由代码

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login/Index.dart';
import 'package:flutter_application_1/pages/Main/Mainpage.dart';

// 返回App根级组件
Widget getRootWidget() {
  return MaterialApp(initialRoute: "/", routes: getRootRoutes());
}
// 返回该App的路由配置

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(), // 底部导航栏4个页面路由
    "/login": (context) => LoginPage(), // 登录路由
  };
}
