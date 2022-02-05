import 'dart:async';
import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'home_screen.dart';
import 'main.dart';
import 'movie_json.dart';
class WatchTrailerScreen extends StatefulWidget {

  String title,actor,rDate,director,rating,desc,movpath;

  List<Image>  cList;
  List<String>  dialogList;

  WatchTrailerScreen(
      {required this.title,required this.actor,required this.director,required this.rDate,required this.rating, required this.desc,required this.cList,required this.dialogList,required this.movpath});

  @override
  _WatchTrailerScreenState createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {


  late VideoPlayerController _videoPlayerController;
 late  Future<void> _initializeVideoPlayerFuture;
  CarouselController controller=CarouselController();
  late List<bool> flag= [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  void initState() {
    // _videoPlayerController = VideoPlayerController.network("https://youtu.be/QAmXYpSy5ng");
     _videoPlayerController = VideoPlayerController.asset(widget.movpath);
     _initializeVideoPlayerFuture = _videoPlayerController.initialize();
     _videoPlayerController.setLooping(false);
     _videoPlayerController.setVolume(1.0);
     flag=this.flag;

     print(widget.dialogList.first);
     super.initState();


  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
  //
  // Future<bool> started() async {
  //   await _videoPlayerController.initialize();
  //   await _videoPlayerController.play();
  //   startedPlaying = true;
  //   return true;
  // }
  int index=0;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Trailer".toUpperCase(),
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Ringbearer'
          ),
        ),
      ),
      backgroundColor: Colors.black,

    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget> [

      GestureDetector(
        onTap: (){
          if(_videoPlayerController.value.isPlaying){
            _videoPlayerController.pause();
          }
          else{
            _videoPlayerController.play();
          }
        },
        child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
          builder: (context,snapshot) {

            if (snapshot.connectionState == ConnectionState.done) {
              _videoPlayerController.play();
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),


    SizedBox(height: 20,),

            Flex(direction: Axis.horizontal,


              children: [

                Flexible(
                    flex: 2,
                    child:

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const[
                  Text("Title: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  ),
              SizedBox(height: 5,),
              Text("Actor: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,


                ),

              ),
                    SizedBox(height: 5,),

                    Text("Director: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,


                      ),
                    ),
                    SizedBox(height: 5,),
                    Text("Released Date: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,


                      ),
                    ),
                    SizedBox(height: 5,),
                Text("Rating: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,


                  ),
                )
                  ],
                )

                ),
                SizedBox(width: 20,),

                Flexible(
                  flex: 3,

                    child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(widget.actor,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,


                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(widget.director,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,


                      ),
                    ),
                  const  SizedBox(height: 5,),
                    Text(widget.rDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,


                      ),
                    ),
                   const SizedBox(height: 5,),
                   const  MyRatingBar(),
                  ],
                )

                )
              ],
            ),
            const SizedBox(height: 10,),

           const  Text("Description:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700
              ),
            ),
            const  SizedBox(height: 10,),

            Text(widget.desc,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                
              ),

            ),

            ///Carousel///

            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),

              child: CarouselSlider.builder(
                itemCount: widget.cList.length,
                carouselController: controller,
                options: CarouselOptions(

                    viewportFraction: 0.27,
                    autoPlay: true,
                    pauseAutoPlayInFiniteScroll: true,
                    enlargeCenterPage: true,
                    scrollPhysics: BouncingScrollPhysics().parent,

                    onPageChanged: (i, reason) {
                      setState(() {
                        index = i;
                      });
                    }
                ),
                itemBuilder: (context, i, id){
                  return GestureDetector(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:BorderRadius.all(Radius.circular(300)),
                        //
                        // BorderRadius.only(topLeft: Radius.circular(100),
                        // topRight: Radius.circular(100),
                        //   bottomLeft: Radius.circular(100),
                        //   bottomRight: Radius.circular(100),
                        // ),

                      ),
                      child: ClipRRect(
                        borderRadius:const BorderRadius.all(Radius.circular(300)),
                        child: widget.cList[i],
                      ),
                      //ClipRRect for image border radius
                    ),
                    onTap: ()
                      {
                       _shoDialog(context,widget.dialogList[i]);
                       print("clicek ${dialogList1[i]}");
                      }
                    //   async {
                    //     await showDialog(
                    //         context: context,
                    //         builder: (_) => ImageDialog()
                    //   );
                    // },
                  );
                },
              ),
            ),



          ],
        ),
    ),

    ));
  }
}

void _shoDialog(BuildContext context, String path){
  String imgPath=path;
  YYDialog().build(context)

    ..borderRadius = 20.0
    ..widget(

      Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.width * 0.80,

        decoration:  BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: const Color(0xFFFFFF),
          image: DecorationImage(
              image: ExactAssetImage(imgPath),
              fit: BoxFit.cover
          ),
        ),
      ),
    )
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..show();

}
