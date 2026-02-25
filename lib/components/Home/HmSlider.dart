//轮播图

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/Home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList; //轮播图列表集合

  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  CarouselSliderController _controller =
      CarouselSliderController(); // 控制轮播图跳转的控制器

  int _currentIndex = 0; //指示条索引
  //轮播图
  Widget _getSlider() {
    // 在Flutter中获取屏幕宽度的方法
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double _secon = 1.5;
    // 返回轮播图插件
    // 根据数据渲染的不同的轮播选项
    return CarouselSlider(
      carouselController: _controller,
      items: List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: screenWidth, //设置屏幕宽度
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1, //设置轮播图所占比例
        // autoPlayInterval: Duration(seconds: 3), //设置轮播自动播放速度
        // autoPlay: true, //设置轮播图是否自动播放
        height: 300,
        //指示条点击更换组件，自动播放也可以切换指示条
        onPageChanged: (int index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  //搜索框
  Widget _getSearch() {
    // 返回搜索框插件
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4), //设置黑色透明度
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  //轮播图指示条
  Widget _getDots() {
    // 返回指示条导航布局
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // 主轴居中
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _controller.jumpToPage(index); //设置跳转属性
              },
              //动画组件AnimatedContainer
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300), //设置指示条自动播放时间
                height: 6,
                width: index == _currentIndex ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Stack -> 轮播图 搜索框 指示灯导航设置方法调用
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
    // Container(
    //   alignment: Alignment.center,
    //   height: 300,
    //   color: Colors.blue,
    //   child: Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20)),
    // );
  }
}
