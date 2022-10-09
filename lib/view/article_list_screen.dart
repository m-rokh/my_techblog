import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_teckblog/component/my_colors.dart';
import 'package:my_teckblog/component/text_style.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
         Padding(
           padding: const EdgeInsets.only(left: 16),
           child: Center(child: Text("مقالات جدید",style: appBarTextStyle,)),
         ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: SolidColors.primeryColor.withAlpha(100),
            shape: BoxShape.circle
          ),
        ),
      ),),
    ));
  }
}
