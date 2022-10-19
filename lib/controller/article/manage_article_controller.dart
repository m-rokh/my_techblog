import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_teckblog/constant/api_constant.dart';
import 'package:my_teckblog/models/article_info_model.dart';
import 'package:my_teckblog/models/article_model.dart';
import 'package:my_teckblog/models/tags_model.dart';
import 'package:my_teckblog/services/dio_service.dart';

class ManageArticleConroller extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  // ignore: non_constant_identifier_names
  RxBool Loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          'اینجاعنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
          """
لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز
""",
          "")
      .obs;

  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
    Loading.value = true;
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    //var response = await DioService().getMethod(ApiConstant.publishedByMe+GetStorage().read(StorageKey.userId));
    var response =
        await DioService().getMethod(ApiConstant.publishedByMe + "1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      Loading.value = false;
    }
  }

  updateTitle() {
    articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }
}
