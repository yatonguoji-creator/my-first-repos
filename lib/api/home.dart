// 封装一个api,调用工厂函数， 目的是返回业务侧要的数据结构

import 'package:flutter_application_1/constants/index.dart';
import 'package:flutter_application_1/utils/Dioreqshi.dart';
import 'package:flutter_application_1/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.formJSON(item as Map<String, dynamic>);
  }).toList();
}
