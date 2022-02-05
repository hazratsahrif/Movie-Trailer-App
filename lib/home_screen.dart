import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie/movie_json.dart';
import 'package:movie/watch_trailer_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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


  int index=0;
  late AssetImage img;
   late Curve _animation;

  List<AssetImage> mainList =[

    const AssetImage("assets/images/img 2.jpeg"),
    const AssetImage("assets/images/img 3.jpeg"),
    const AssetImage("assets/images/img 1.jpeg"),

    const AssetImage("assets/images/img 4.jpeg"),
    const AssetImage("assets/images/img 5m.jpeg"),
    const AssetImage("assets/images/luca m.jpg"),
    const AssetImage("assets/images/jb m.jpeg"),



  ];

  List<Image> cardList =[

    Image.asset("assets/images/img 2.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),
    Image.asset("assets/images/img 3.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),
    Image.asset("assets/images/img 1.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),

    Image.asset("assets/images/img 4.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),
    Image.asset("assets/images/img 5.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),
    Image.asset("assets/images/luca.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),
    Image.asset("assets/images/img 6.jpeg",height: 250,
        width: 180,
        fit: BoxFit.cover),


  ];
  void _upDate(){
    _animation = Curves.bounceIn;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = Curves.bounceIn;

  }




  @override
  Widget build(BuildContext context) {
    late AssetImage img=mainList[index];
    return SafeArea(
      child: Scaffold(

        body: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: _animation,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: img,
                fit: BoxFit.cover,

              )
          ),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                child: CarouselSlider.builder(
                  itemCount: mainList.length,
                  carouselController: controller,

                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.67,

                      viewportFraction: 0.59,
                      enlargeCenterPage: true,
                      scrollPhysics: ClampingScrollPhysics().parent,
                      disableCenter: true,

                      onPageChanged: (i, reason) {
                        setState(() {
                          index = i;
                          print(index);
                          _upDate();
                          _animation=Curves.decelerate;
                        });
                      }
                  ),

                  itemBuilder: (context, i, id){

                    return GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.all(Radius.circular(100)),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            ClipRRect(
                              borderRadius:const BorderRadius.all(Radius.circular(100)),
                              child: cardList[i],
                            ),

                            Align(
                              alignment:Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),

                                decoration:const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    color: Colors.black
                                ),
                                child: IconButton(
                                  icon: flag[i]==false ?const Icon(Icons.favorite_border,color: Colors.white,):
                                  const Icon(Icons.favorite,color: Colors.amber,),
                                  onPressed: (){

                                    setState(() {
                                      if(flag[i]==false){
                                        flag[i]=true;

                                      }
                                      else{
                                        flag[i]=false;
                                      }

                                      print(flag);
                                    });

                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 10,),
                            const Text("No Time To Die",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600

                              ),
                            ),
                            const SizedBox(height: 6,),
                            MyRatingBar(),
                            Spacer(),

                            SizedBox(
                              height:45,
                              child: MaterialButton(onPressed: (){
                                // Get.to(()=>WatchTrailerScreen());

                                 index==0 || index==1?
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (
                                          BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          alignment: Alignment.center,
                                          child: WatchTrailerScreen(
                                            title: MovieListData[index]['title'],
                                            actor: MovieListData[index]['actor'],
                                            director: MovieListData[index]['director'],
                                            rDate: MovieListData[index]['releasedDate'],
                                            rating: MovieListData[index]['rating'],
                                            desc: MovieListData[index]['desc'],
                                            cList: MovieListData[index]['cImages'],
                                            dialogList:MovieListData[index]['dImages'],
                                            movpath: MovieListData[index]['movPath'],
                                          ),

                                        );
                                      },
                                      transitionsBuilder: (
                                          BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secondaryAnimation,
                                          Widget child) {
                                        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
                                        return Align(
                                          child: SizeTransition(
                                            sizeFactor: animation,
                                            child: child,
                                          ),
                                        );
                                      },
                                      transitionDuration: Duration(milliseconds: 300),
                                    ),
                                  ):print(null);

                              },
                                child: Text("View Trailer".toUpperCase(),style: TextStyle(color: Colors.white),),
                                color: Colors.black,

                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(899),
                                      topLeft:  Radius.circular(900),
                                      bottomRight: Radius.circular(2800),
                                      bottomLeft: Radius.circular(2800),


                                    )),


                              ),
                            ),

                          ],
                        ),
                        //ClipRRect for image border radius
                      ),
                      onTap: (){
                        setState(() {

                          print(controller);
                          print(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MyRatingBar extends StatelessWidget {
  const MyRatingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      itemSize: 22,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.grey,
      itemPadding:const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}