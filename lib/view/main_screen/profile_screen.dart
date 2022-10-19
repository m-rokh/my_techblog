import 'package:flutter/material.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/constant/my_colors.dart';
import 'package:my_teckblog/component/my_component.dart';
import 'package:my_teckblog/constant/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.images.profileAvatar.path),
                height: 90,
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(Assets.icons.bluePen.path),
                    color: SolidColors.seeMore,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    MyStrings.imageProfileEdit,
                    style: textTheme.headline3,
                  )
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
              TecDivider(size: size),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primeryColor,
                child: SizedBox(
                    height: 45,
                    child: Center(
                        child: Text(
                      MyStrings.myFavBlog,
                      style: textTheme.headline4,
                    ))),
              ),
              TecDivider(size: size),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primeryColor,
                child: SizedBox(
                    height: 45,
                    child: Center(
                        child: Text(
                      MyStrings.myFavPodcast,
                      style: textTheme.headline4,
                    ))),
              ),
              TecDivider(size: size),
              InkWell(
                onTap: () {},
                splashColor: SolidColors.primeryColor,
                child: SizedBox(
                    height: 45,
                    child: Center(
                        child: Text(
                      MyStrings.logOut,
                      style: textTheme.headline4,
                    ))),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }
}
