import 'package:flutter/material.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/component/my_colors.dart';
import 'package:my_teckblog/view/home_screen.dart';
import 'package:my_teckblog/view/profile_screen.dart';
import 'package:my_teckblog/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold( 
        key: _key,
        //drawer
        drawer: Drawer(
          backgroundColor: SolidColors.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 3,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "تک بلاگ در گیت هاب",
                    style: textTheme.headline4,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        // appbar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scafoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
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
        //body
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                  child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin), // HomeScreen(0)
                  const RegisterIntro(), //RegisterIntro (1)
                  ProfileScreen(size: size,textTheme: textTheme,bodyMargin: bodyMargin), // ProfileScreen (2)
                ],
              )),
              BottomNavigation(
                  size: size,
                  bodyMargin: bodyMargin,
                  changeScreen: (int valu) {
                    setState(() {
                      selectedPageIndex = valu;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                gradient: LinearGradient(colors: GradiantColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => changeScreen(0),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.home.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => changeScreen(1),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.write.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () => changeScreen(2),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.user.path),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
