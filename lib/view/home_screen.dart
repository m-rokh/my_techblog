


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_teckblog/gen/assets.gen.dart';
import 'package:my_teckblog/models/fake_data.dart';
import 'package:my_teckblog/my_colors.dart';
import 'package:my_teckblog/my_strings.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({
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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            //poster
            homePagePoster(size: size, textTheme: textTheme),

            const SizedBox(
              height: 16,
            ),

            // tag List
            homePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),

            const SizedBox(
              height: 32,
            ),

            // see more
            seeMoreBlog(bodyMargin: bodyMargin, textTheme: textTheme),

            // blog list
            homePageBlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            
            const SizedBox(
              height: 32,
            ),

            // see more
            seeMorePadcast(bodyMargin: bodyMargin, textTheme: textTheme),
            // padcast List
            homePagePadcastList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class homePagePadcastList extends StatelessWidget {
  const homePagePadcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // blog item
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 15),
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
                              borderRadius:
                                  const BorderRadius.all(
                                      Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration:
                              const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(16)),
                                  gradient: LinearGradient(
                                      begin: Alignment
                                          .bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradiantColors
                                          .blogPost)),
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
                      maxLines: 1,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

class seeMorePadcast extends StatelessWidget {
  const seeMorePadcast({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class homePageBlogList extends StatelessWidget {
  const homePageBlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // blog item
          return Padding(
            padding: EdgeInsets.only(
                right: index == 0 ? bodyMargin : 15),
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
                              borderRadius:
                                  const BorderRadius.all(
                                      Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration:
                              const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(16)),
                                  gradient: LinearGradient(
                                      begin: Alignment
                                          .bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradiantColors
                                          .blogPost)),
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
    );
  }
}

class seeMoreBlog extends StatelessWidget {
  const seeMoreBlog({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class homePageTagList extends StatelessWidget {
  const homePageTagList({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  padding:
                      const EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(
                            Assets.icons.hashtagicon.path),
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
    );
  }
}

class homePagePoster extends StatelessWidget {
  const homePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.15,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            image: DecorationImage(
                image:
                    AssetImage(homePagePosterMap["imageAsset"]),
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
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
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
    );
  }
}
