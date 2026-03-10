//分类页面代码

import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/Home.dart';

class Hmcategory extends StatefulWidget {
  final List<CategoryItem> categoryList; //分类列表集合

  Hmcategory({Key? key, required this.categoryList}) : super(key: key);

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
        itemCount: widget.categoryList.length,
        itemBuilder: (BuildContext context, int index) {
          // 从分类列表中获取分类项
          final categoryItem = widget.categoryList[index];
          return Container(
            alignment: Alignment.center,
            height: 100,
            width: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 242, 243),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Image.network(categoryItem.picture, width: 40, height: 40),
                Text(categoryItem.name, style: TextStyle(color: Colors.black)),
              ],
            ),
            // margin: EdgeInsets.symmetric(horizontal: 10),
          );
        },
      ),
    );
  }
}
