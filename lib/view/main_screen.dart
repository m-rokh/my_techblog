import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/my_colors.dart';
import 'package:my_teckblog/my_strings.dart';
import 'package:my_teckblog/view/home_screen.dart';

import '../models/fake_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return Scaffold(
      // appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: SolidColors.scafoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            Image(
              image: AssetImage(Assets.images.logo.path),
              height: size.height / 13.6,
            ),
            const Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: size.height / 10,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: GradiantColors.bottomNavBackgroand,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Padding(
                  padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                  child: Container(
                    height: size.height / 8,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        gradient:
                            LinearGradient(colors: GradiantColors.bottomNav)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.home.path),
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.write.path),
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage(Assets.icons.user.path),
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
