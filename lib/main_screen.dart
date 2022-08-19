import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/my_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0,16,0,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.menu),
                Image(image: AssetImage(Assets.images.logo.path),height: size.height/13.6,),
                const Icon(Icons.search)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Container(
                  width: size.width/1.15,
                  height: size.height/4.2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16),
                     ),
                     image: DecorationImage(image: AssetImage(Assets.images.posterTest.path),fit: BoxFit.cover),
                     
                  ),
                ),

                Container(
                  width: size.width/1.15,
                  height: size.height/4.2,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16),
                     ),
                     gradient: LinearGradient(
                      colors: GradiantColors.homePosterCoverGradiant,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                     )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
