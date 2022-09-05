import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/models/fake_data.dart';
import 'package:my_teckblog/my_colors.dart';
import 'package:my_teckblog/my_strings.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(Assets.images.profileAvatar.path),height: 90,
            ),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage(Assets.icons.bluePen.path),color: SolidColors.seeMore,),
                const SizedBox(
                  width: 8,
                ),
                Text(MyStrings.imageProfileEdit,style: textTheme.headline3,)
              ],
            ),
            const SizedBox(
              height: 60,
            ),

            Text("محمدرضارخ ", style: textTheme.headline4),
            Text("m.rokh93@gmail.com", style: textTheme.headline4),

            const SizedBox(
              height: 40,
            ),

            Divider(
              thickness: 1,
              color: SolidColors.dividerColor,
              indent: size.width/6,
              endIndent: size.width/6,
            ),
          ],
        ));
  }
}
