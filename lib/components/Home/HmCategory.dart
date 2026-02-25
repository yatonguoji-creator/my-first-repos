//分类页面代码

import 'package:flutter/material.dart';

class Hmcategory extends StatefulWidget {
  Hmcategory({Key? key}) : super(key: key);

  @override
  _HmcategoryState createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    // return ListView();
    // 返回一个横向滚动的组件，注意listview不能设置高度
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            height: 100,
            width: 80,
            color: Colors.blue,
            child: Text("分类$index", style: TextStyle(color: Colors.white)),
            margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}
