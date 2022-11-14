import 'package:flutter/material.dart';
import 'package:hotstar_clone/network/ProviderClass.dart';
import 'package:hotstar_clone/screens/models/top_rated.dart';
import 'package:hotstar_clone/screens/models/trending_movies.dart';
import 'package:hotstar_clone/screens/models/tv_shows.dart';
import 'package:hotstar_clone/utils/colors.dart';
import 'package:hotstar_clone/widgets/header_widegt.dart';
import 'package:hotstar_clone/widgets/latest_trending_bottom.dart';
import 'package:hotstar_clone/widgets/top_rated_bottom.dart';
import 'package:hotstar_clone/widgets/tv_shows_bottom.dart';
import 'package:video_player/video_player.dart';
import '../data/images.dart';
import '../models/video_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProviderClass _provider = ProviderClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const HeaderBarWidget(),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColors.blackColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 350,
                    child: Image.asset(
                        'assets/images/dream11_ad.jpeg',
                        fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                      'assets/images/dream11_logo.png',
                                      scale: 20,
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height:15,
                                        width:20,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.circular(2.0)
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Ad",
                                            style: TextStyle(color:Colors.black, fontSize: 10, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabBold", fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "\t\tDream11",
                                        style: TextStyle(color:Colors.white, fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabLight", fontStyle: FontStyle.normal),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        "Join 12 Crore+ Users",
                                        style: TextStyle(color:Colors.white60, fontSize: 12, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: AppColors.blueColor),
                                color: AppColors.blackColor),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  children: const [
                                    Text(
                                      "Play Now",
                                      style:TextStyle(
                                        color: AppColors.blueColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
                                        fontFamily: "RobotoSlabMedium",
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 250,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return VideoItems(
                    videoPlayerController: VideoPlayerController.asset(videos[index]),
                    looping: true,
                    autoplay: true,
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Continue Watching",
              style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              primary: false,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width:210,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/dream11_ad.jpeg"),
                              fit: BoxFit.cover),
                        ),
                        height: 150,
                      ),
                    ),
                    ProgressIndicatorDemo()
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Top Rated",
              style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
            ),
          ),
          FutureBuilder(
            future: _provider.getTopRatedMovies(),
            builder: (BuildContext context, AsyncSnapshot<TopRated> snapshot) {
              return
                SizedBox(
                height: 190,
                child: ListView.builder(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                  barrierColor: Colors.black54,
                                  enableDrag: true,
                                  elevation: 10,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                  ),
                                context: context,
                                builder: (BuildContext context) {
                                  return TopRatedBottomSheet(selectedIndex: index,);
                                },
                              );
                              //Get.to(TopRatedBottomSheet());
                          },
                            child: Container(
                              width:135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                    //image: AssetImage("assets/images/film.jpeg"),
                                    image: NetworkImage("https://image.tmdb.org/t/p/w500/" + snapshot.data!.results![index].posterPath.toString()),
                                    fit: BoxFit.cover),
                              ),
                              height: 175,
                            ),
                          ),
                        ), 
                      ],
                    );
                  },
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Latest & Trending",
              style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
            ),
          ),
          FutureBuilder(
            future: _provider.getTrendingMovies(),
            builder: (BuildContext context, AsyncSnapshot<TrendingMovies> snapshot) {
              return SizedBox(
                height: 190,
                child: ListView.builder(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                barrierColor: Colors.black54,
                                enableDrag: true,
                                elevation: 10,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return LatestTrendingBottomSheet(selectedIndex: index,);
                                },
                              );
                            },
                            child: Container(
                              width:135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  //image: AssetImage("assets/images/film.jpeg"),
                                    image: NetworkImage("https://image.tmdb.org/t/p/w500/" + snapshot.data!.results![index].posterPath.toString()),
                                    fit: BoxFit.cover),
                              ),
                              height: 175,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "TV Shows",
              style: TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
            ),
          ),
          FutureBuilder(
            future: _provider.getTvShows(),
            builder: (BuildContext context, AsyncSnapshot<TvShows> snapshot) {
              return SizedBox(
                height: 190,
                child: ListView.builder(
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.results!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: (){
                              showModalBottomSheet(
                                barrierColor: Colors.black54,
                                enableDrag: true,
                                elevation: 10,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return TvShowsBottomSheet(selectedIndex: index,);
                                },
                              );
                            },
                            child: Container(
                              width:135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                image: DecorationImage(
                                  //image: AssetImage("assets/images/film.jpeg"),
                                    image: NetworkImage("https://image.tmdb.org/t/p/w500/" + snapshot.data!.results![index].posterPath.toString()),
                                    fit: BoxFit.cover),
                              ),
                              height: 175,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

}

class ProgressIndicatorDemo extends StatefulWidget {

  @override
  _ProgressIndicatorDemoState createState() =>
      _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double _progress = 1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.repeat();
  }


  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: SizedBox(width: 200,child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: LinearProgressIndicator( value:  10,))),
    );
  }

}