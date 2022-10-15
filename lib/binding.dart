import 'package:get/get.dart';
import 'package:my_teckblog/controller/list_article_controller.dart';
import 'package:my_teckblog/controller/register_controller.dart';
import 'package:my_teckblog/controller/single_article_controller%20copy.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}