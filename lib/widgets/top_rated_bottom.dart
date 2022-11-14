import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:hotstar_clone/network/ProviderClass.dart';
import 'package:hotstar_clone/screens/data/images.dart';
import 'package:hotstar_clone/screens/movie/play_%20movie.dart';

import '../screens/models/top_rated.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class TopRatedBottomSheet extends StatefulWidget {
  final int selectedIndex;
  const TopRatedBottomSheet({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<TopRatedBottomSheet> createState() => _TopRatedBottomSheetState();
}

class _TopRatedBottomSheetState extends State<TopRatedBottomSheet> {
  final ProviderClass _provider = ProviderClass();
  String discription = "";
  String videosUrl = "";
  @override
  void initState() {
    videosUrl = videoNetWorkUrl[widget.selectedIndex].toString();
    print("Index Val" + widget.selectedIndex.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FutureBuilder(
        future: _provider.getTopRatedMovies(),
        builder: (BuildContext context, AsyncSnapshot<TopRated> snapshot) {
          return Expanded(
            child: GFCarousel(
              hasPagination: false,
              height: 400,
              initialPage: widget.selectedIndex,
              autoPlay: false,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              viewportFraction: 1.0,
              aspectRatio: 1.50,
              reverse: false,
              enableInfiniteScroll: false,
              onPageChanged: (val){
                setState(() {
                  videosUrl = videoNetWorkUrl[val].toString();
                });
              },
              items: snapshot.data!.results!.map((e) {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                          //image: AssetImage("assets/images/film.jpeg"),
                            image: NetworkImage("https://image.tmdb.org/t/p/w500/" + e.posterPath.toString()),
                            fit: BoxFit.fill),
                      ),
                      height: 250,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e.title.toString(),
                          style: const TextStyle(
                              color:Colors.white, fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "Watchlist",
                              style: TextStyle(
                                  color:Colors.white, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Column(
                          children: [
                            SizedBox(
                              width: 120,
                              child:
                              ElevatedButton(
                                onPressed: (){
                                  Get.to(PlayMovieScreen(strTitle: e.title.toString(), strDescription: e.overview.toString(), strReleaseDate: e.releaseDate.toString(), strRatings: e.voteAverage.toString(), strImageUrl: "https://image.tmdb.org/t/p/w500/" + e.posterPath.toString(), strVideoUrl: videosUrl, strMovieId: e.id.toString()));
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.white),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(AppColors.darkBlueColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: const BorderSide(color: AppColors.blueColor))),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.arrow_right,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      AppStrings.btnWatch,
                                      style: const TextStyle(
                                          color:Colors.white, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30,),
                        Column(
                          children: const [
                            Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            Text(
                              "Info",
                              style: TextStyle(
                                  color:Colors.white, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                e.overview.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: const TextStyle(
                                    color:Colors.white38, fontSize: 12, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
