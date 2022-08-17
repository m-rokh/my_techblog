import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/my_colors.dart';

class splashScreen extends StatelessWidget {
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
