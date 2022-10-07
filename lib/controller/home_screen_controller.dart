import 'package:get/get.dart';
import 'package:my_teckblog/component/api_constant.dart';
import 'package:my_teckblog/models/article_model.dart';
import 'package:my_teckblog/models/podcast_model.dart';
import 'package:my_teckblog/models/poster_model.dart';
import 'package:my_teckblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;

  RxList tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPadcasts = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element) {
        topPadcasts.add(PodcastModel.fromJson(element));
      });
    }
  }
}
