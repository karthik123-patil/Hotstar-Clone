import 'package:chewie/chewie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotstar_clone/network/ProviderClass.dart';
import 'package:video_player/video_player.dart';

import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../models/similar_movies.dart';

class PlayMovieScreen extends StatefulWidget {
  final String strTitle, strDescription, strReleaseDate, strRatings, strImageUrl, strVideoUrl, strMovieId;
  const PlayMovieScreen({Key? key, required this.strTitle, required this.strDescription, required this.strReleaseDate, required this.strRatings, required this.strImageUrl, required this.strVideoUrl, required this.strMovieId}) : super(key: key);

  @override
  State<PlayMovieScreen> createState() => _PlayMovieScreenState();
}

class _PlayMovieScreenState extends State<PlayMovieScreen> {
  final urlYoutube =
      'https://www.youtube.com/watch?v=E7sz-nz_6wY';
  final urlVideo = 'https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4';
  final textController = TextEditingController();
  late VideoPlayerController _controller;
  final ProviderClass _provider = ProviderClass();
  late ChewieController _chewieController;
  @override
  void initState() {
    textController.text = urlYoutube;
    _controller = VideoPlayerController.network(widget.strVideoUrl);
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoInitialize: true,
        autoPlay: true,
        looping: false,
        allowMuting: true,
        allowFullScreen: true,
        useRootNavigator: true,
        zoomAndPan: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
   // _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black45,
        child: Column(
          children: [
            const SizedBox(height: 35,),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(0),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Chewie(
                              controller: _chewieController,
                            ),
                          )
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 10,
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25,),
                          onPressed: (){
                            Get.back();
                           _controller.dispose();
                            _chewieController.dispose();
                          },
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen_rounded , color: Colors.white, size: 25,),
                        onPressed: (){
                          _chewieController.enterFullScreen();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Image.network(widget.strImageUrl, height: 120,),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              widget.strTitle,
                              style:const TextStyle(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                            ),
                            const Text(
                              "Action . Adventure",
                              style: TextStyle(color:Colors.white30, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                            ),
                            Row(
                              children:  [
                                const Icon(Icons.star, color: Colors.white30, size: 15,),
                                const SizedBox(width: 5,),
                                Text(
                                  widget.strRatings,
                                  style:const TextStyle(color:Colors.blue, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                            Row(
                              children:  [
                                const Text(
                                  "Release Date:\t",
                                  style: TextStyle(color:Colors.white30, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                                ),
                                Text(
                                  widget.strReleaseDate,
                                  style:const TextStyle(color:Colors.white, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                    child: Row(
                      children:  [
                        Expanded(
                            child:  ExpandableText(
                              widget.strDescription,
                              trimLines: 3,
                            )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 125,
                          child: ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white12),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(color: Colors.white12))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 2,),
                                Text(
                                  AppStrings.btnDownload,
                                  style: const TextStyle(
                                      color:Colors.white, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 125,
                          child: ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white12),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(color: Colors.white12))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  AppStrings.btnWatchlist,
                                  style: const TextStyle(
                                      color:Colors.white, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 125,
                          child: ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white12),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: const BorderSide(color: Colors.white12))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5,),
                                Text(
                                  AppStrings.btnShare,
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
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const[
                        Text("Trailer & Extras", textAlign:TextAlign.start ,style: TextStyle(
                            color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 130,
                          width:250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(widget.strImageUrl),
                                fit: BoxFit.fill,
                              )
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 90,
                                left: -10,
                                child: IconButton(
                                  icon: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30,),
                                  onPressed: (){

                                  },
                                ),
                              ),
                              Positioned(
                                top: 106,
                                left: 35,
                                child: Text(
                                  widget.strTitle + " -Trailer",
                                  style:const TextStyle(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w700,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                                ),),
                              const Positioned(
                                top: 5,
                                right: 20,
                                child: Text(
                                  "1 min",
                                  style:TextStyle(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w700,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
                                ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const[
                        Text("More Like This", textAlign:TextAlign.start ,style: TextStyle(
                            color:Colors.white, fontSize: 20, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal
                        ),),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: _provider.getSimilarMovies(widget.strMovieId),
                    builder: (BuildContext context, AsyncSnapshot<SimilarMovies> snapshot) {
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
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                    onTap: (){

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
            )
          ],
        ),
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration(),
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),

      ],
    );
  }
}

class ExpandableText extends StatefulWidget {
  const ExpandableText(
      this.text, {
        Key? key,
        this.trimLines = 3,
      })  : super(key: key);

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;
  void _onTapLink() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    const colorClickableText = Colors.blue;
    const widgetColor = Colors.white30;
    TextSpan link = TextSpan(
        text: _readMore ? " more" : "less",
        style: const TextStyle(
          color: colorClickableText,
        ),
        recognizer: TapGestureRecognizer()..onTap = _onTapLink
    );
    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;
        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );
        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection.rtl,//better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;
        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;
        // Get the endIndex of data
        int? endIndex;
        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height,
        ));
        endIndex = textPainter.getOffsetBefore(pos.offset);
        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore
                ? widget.text.substring(0, endIndex)
                : widget.text,
            style: const TextStyle(color:widgetColor, fontSize: 15, fontWeight: FontWeight.w500,letterSpacing: 0.2, fontFamily: "RobotoSlabMedium", fontStyle: FontStyle.normal),
            children: <TextSpan>[link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }
        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}