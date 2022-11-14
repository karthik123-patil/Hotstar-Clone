import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:hotstar_clone/network/ProviderClass.dart';
import 'package:hotstar_clone/screens/models/trending_movies.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class LatestTrendingBottomSheet extends StatefulWidget {
  final int selectedIndex;
  const LatestTrendingBottomSheet({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<LatestTrendingBottomSheet> createState() => _LatestTrendingBottomSheetState();
}

class _LatestTrendingBottomSheetState extends State<LatestTrendingBottomSheet> {
  final ProviderClass _provider = ProviderClass();
  String discription = "";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: FutureBuilder(
        future: _provider.getTrendingMovies(),
        builder: (BuildContext context, AsyncSnapshot<TrendingMovies> snapshot) {
          return Expanded(
            child:
            GFCarousel(
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
                              child: ElevatedButton(
                                onPressed: null,
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

/*ListView.builder(
              physics: const PageScrollPhysics(),
              primary: true,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (BuildContext context, int index) {
                 discription = snapshot.data!.results![index].overview.toString();
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                          //image: AssetImage("assets/images/film.jpeg"),
                            image: NetworkImage("https://image.tmdb.org/t/p/w500/" + snapshot.data!.results![index].posterPath.toString()),
                            fit: BoxFit.fill),
                      ),
                      height: 250,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data!.results![index].title.toString(),
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
                              child: ElevatedButton(
                                onPressed: null,
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
                                snapshot.data!.results![index].overview.toString(),
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
              },
            ),*/