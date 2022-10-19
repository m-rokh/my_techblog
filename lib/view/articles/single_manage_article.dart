import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:my_teckblog/component/dimens.dart';
import 'package:my_teckblog/constant/my_colors.dart';
import 'package:my_teckblog/component/my_component.dart';
import 'package:my_teckblog/constant/my_strings.dart';
import 'package:my_teckblog/controller/article/list_article_controller.dart';
import 'package:my_teckblog/controller/article/manage_article_controller.dart';
import 'package:my_teckblog/controller/file_controller.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/services/pick_file.dart';
import 'package:my_teckblog/view/articles/article_list_screen.dart';

// ignore: must_be_immutable
class SingleManageArticle extends StatelessWidget {
  SingleManageArticle({Key? key}) : super(key: key);

  var manageArticleConroller = Get.find<ManageArticleConroller>();
  FilePickerController filePickerController = Get.put(FilePickerController());
  getTitle() {
    Get.defaultDialog(
      title: "عنوان مقاله",
      content: TextField(
        controller: manageArticleConroller.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: SolidColors.colorTitle),
        decoration: const InputDecoration(hintText: "اینجا بنویس"),
      ),
      backgroundColor: SolidColors.primeryColor,
      radius: 8,
      confirm: ElevatedButton(
          onPressed: () {
            manageArticleConroller.updateTitle();
            Get.back();
          },
          child: const Text("ثبت")),
      titleStyle: const TextStyle(
        color: SolidColors.scafoldBg,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(children: [
            Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height / 3,
                  child: filePickerController.file.value.name == 'nothing'
                      ? CachedNetworkImage(
                          imageUrl: manageArticleConroller
                              .articleInfoModel.value.image!,
                          imageBuilder: ((context, imageProvider) =>
                              Image(image: imageProvider)),
                          placeholder: ((context, url) => const Loading()),
                          errorWidget: ((context, url, error) => Image.asset(
                                Assets.images.singlePlaceHolder.path,
                                fit: BoxFit.cover,
                              )),
                        )
                      : Image.file(
                          File(filePickerController.file.value.path!),
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: GradiantColors.singleAppbarGradiant)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: (() => Get.back()),
                            child: GestureDetector(
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                    )),
                Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          //pick file
                          pickFiles();
                        },
                        child: Container(
                          height: 30,
                          width: Get.width / 3,
                          decoration: const BoxDecoration(
                              color: SolidColors.primeryColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "انتخاب تصویر ",
                                style: textheme.headline2,
                              ),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                //get title
                getTitle();
              },
              child: SeeMoreBlog(
                  bodyMargin: Dimens.halfBodyMargin,
                  textTheme: textheme,
                  title: "ویرایش عنوان مقاله"),
            ),
            Padding(
              padding: EdgeInsets.all(Dimens.halfBodyMargin),
              child: Text(
                manageArticleConroller.articleInfoModel.value.title!,
                maxLines: 2,
                style: textheme.titleLarge,
              ),
            ),
            SeeMoreBlog(
                bodyMargin: Dimens.halfBodyMargin,
                textTheme: textheme,
                title: "ویرایش متن اصلی مقاله"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                manageArticleConroller.articleInfoModel.value.content!,
                textStyle: textheme.headline5,
                enableCaching: true,
                onLoadingBuilder: ((context, element, loadingProgress) =>
                    const Loading()),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SeeMoreBlog(
                bodyMargin: Dimens.halfBodyMargin,
                textTheme: textheme,
                title: "انتخاب دسته بندی"),

            //
            //tags(textheme),
          ]),
        ),
      ),
    ));
  }

  Widget tags(textheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: manageArticleConroller.tagList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () async {
                var tagId = manageArticleConroller.tagList[index].id!;
                await Get.find<ListArticleController>()
                    .getArticleListWithTagsId(tagId);
                String tagName = manageArticleConroller.tagList[index].title!;
                Get.to(ArticleListScreen(
                  title: tagName,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: Colors.grey),
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: Text(
                        manageArticleConroller.tagList[index].title!,
                        style: textheme.headline2,
                      )),
                ),
              ),
            );
          })),
    );
  }
}
