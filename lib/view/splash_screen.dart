
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/view/main_screen.dart';
import 'package:my_teckblog/component/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.images.logo.path),
                height: 64,
              ),
              const SizedBox(
                height: 32,
              ),
              const SpinKitCircle(
                color: SolidColors.primeryColor,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
