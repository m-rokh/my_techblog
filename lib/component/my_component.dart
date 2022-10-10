import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_teckblog/component/text_style.dart';
import 'package:my_teckblog/controller/home_screen_controller.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_colors.dart';

class TecDivider extends StatelessWidget {
  const TecDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              AssetImage(Assets.icons.hashtagicon.path),
              color: Colors.white,
              size: 12,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              Get.find<HomeScreenController>().tagsList[index].title!,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){

      await launchUrl(uri);
    
  }else{

    log("could not launch ${uri.toString()}");
  }

  

}

class loading extends StatelessWidget {
  const loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primeryColor,
      size: 32,
    );
  }
}


PreferredSize appBar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
           Padding(
             padding: const EdgeInsets.only(left: 16),
             child: Center(child: Text(title,style: appBarTextStyle,)),
           ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: SolidColors.primeryColor.withAlpha(100),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.keyboard_arrow_right_rounded),
          ),
        ),),
      ),
    );
  }
