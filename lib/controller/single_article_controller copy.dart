// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_teckblog/component/api_constant.dart';
import 'package:my_teckblog/models/article_info_model.dart';
import 'package:my_teckblog/models/article_model.dart';
import 'package:my_teckblog/models/tags_model.dart';
import 'package:my_teckblog/view/single.dart';

import '../services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> releatedList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    Get.to(Single());

    loading.value = true;
    var userId = '';
    debugPrint(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');
    //TODO user id is hard code

    var response = await DioService().getMethod(ApiConstant.baseUrl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });

    releatedList.clear();
    response.data['related'].forEach((element) {
      releatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(Single());
  }
}
