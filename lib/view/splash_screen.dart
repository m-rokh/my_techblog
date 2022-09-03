
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/view/main_screen.dart';
import 'package:my_teckblog/my_colors.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              SizedBox(
                height: 32,
              ),
              SpinKitCircle(
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
