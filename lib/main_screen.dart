import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/my_colors.dart';
import 'package:my_teckblog/my_strings.dart';

import 'models/fake_data.dart';

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
        title:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu,color: Colors.black,),
                  Image(
                    image: AssetImage(Assets.images.logo.path),
                    height: size.height / 13.6,
                  ),
                  const Icon(Icons.search,color: Colors.black,)
                ],
              ),
      ),
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [

              //poster
              Stack(
                children: [
                  Container(
                    width: size.width / 1.15,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                      image: DecorationImage(
                          image: AssetImage(homePagePosterMap["imageAsset"]),
                          fit: BoxFit.cover),
                    ),
                    foregroundDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          colors: GradiantColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homePagePosterMap["writer"] +
                                  " - " +
                                  homePagePosterMap["date"],
                              style: textTheme.subtitle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Like 253",
                                  style: textTheme.subtitle1,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          homePagePosterMap["title"],
                          style: textTheme.headline1,
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              // tag List
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? bodyMargin : 15, 8),
                      child: Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
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
                                  tagList[index].title,
                                  style: textTheme.headline2,
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),

              const SizedBox(
                height: 32,
              ),

              // see more
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.bluePen.path),
                      color: SolidColors.seeMore,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      MyStrings.viewHotestBlog,
                      style: textTheme.headline3,
                    )
                  ],
                ),
              ),

              // blog list
              SizedBox(
                height: size.height / 3.5,
                child: ListView.builder(
                  itemCount: blogList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // blog item
                    return Padding(
                      padding:
                          EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: size.height / 5.3,
                              width: size.width / 2.4,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                blogList[index].imageUrl),
                                            fit: BoxFit.cover)),
                                    foregroundDecoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: GradiantColors.blogPost)),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          blogList[index].writer,
                                          style: textTheme.subtitle1,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              blogList[index].views,
                                              style: textTheme.subtitle1,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Icon(
                                              Icons.remove_red_eye_sharp,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              width: size.width / 2.4,
                              child: Text(
                                blogList[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),

              // see more
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                child: Row(
                  children: [
                    ImageIcon(
                      AssetImage(Assets.icons.microphon.path),
                      color: SolidColors.seeMore,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      MyStrings.viewHotestPodCasts,
                      style: textTheme.headline3,
                    )
                  ],
                ),
              ),
              // blog list
              SizedBox(
                height: size.height / 3.5,
                child: ListView.builder(
                  itemCount: blogList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // blog item
                    return Padding(
                      padding:
                          EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: size.height / 5.3,
                              width: size.width / 2.4,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                blogList[index].imageUrl),
                                            fit: BoxFit.cover)),
                                    foregroundDecoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: GradiantColors.blogPost)),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          blogList[index].writer,
                                          style: textTheme.subtitle1,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              blogList[index].views,
                                              style: textTheme.subtitle1,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Icon(
                                              Icons.remove_red_eye_sharp,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                              width: size.width / 2.4,
                              child: Text(
                                blogList[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    )
    ,bottomNavigationBar: Container(
      height: size.height/10,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: GradiantColors.bottomNavBackgroand,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Container(
        height: size.height/8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          gradient: LinearGradient(colors: GradiantColors.bottomNav)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            IconButton(onPressed: () {},
             icon: ImageIcon(
              AssetImage(Assets.icons.home.path),
              color: Colors.white,)),
            
            IconButton(onPressed: () {},
             icon: ImageIcon(
              AssetImage(Assets.icons.write.path),
              color: Colors.white,)),
            
            IconButton(onPressed: () {},
             icon: ImageIcon(
              AssetImage(Assets.icons.user.path),
              color: Colors.white,)),
          ],
        ),
        
      ),
    ),
    );

  }
}
