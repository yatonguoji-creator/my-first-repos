//主页home页面代码

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Home/HmCategory.dart';
import 'package:flutter_application_1/components/Home/HmHot.dart';
import 'package:flutter_application_1/components/Home/HmMoreList.dart';
import 'package:flutter_application_1/components/Home/HmSlider.dart';
import 'package:flutter_application_1/components/Home/HmSuggestion.dart';
import 'package:flutter_application_1/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 轮播图分类列表
  // List<CategoryItem> _categoryList = [];
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: "1",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
    ),
    BannerItem(
      id: "2",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
    ),
    BannerItem(
      id: "3",
      imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
    ),
  ];

  // 获取滚动容器的内容
  List<Widget> _getScrollChildern() {
    return [
      // 包裹普通widget的sliver家族的组件
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)), // 轮播图组件
      // 放置分类组件
      SliverToBoxAdapter(child: SizedBox(height: 10)), //上下间距

      SliverToBoxAdapter(child: Hmcategory()), //分类页面组件

      SliverToBoxAdapter(child: SizedBox(height: 10)), //上下间距

      SliverToBoxAdapter(child: HmSuggestion()), //推荐组件

      SliverToBoxAdapter(child: SizedBox(height: 10)), //上下间距

      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), //横向间距
          child: Flex(
            direction: Axis.horizontal, //横向
            children: [
              Expanded(child: HmHot()), //爆款推荐1

              SizedBox(width: 10), //高度间距

              Expanded(child: HmHot()), //爆款推荐2
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)), //上下间距
      HmMoreList(), //无限商品表格列表
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}
