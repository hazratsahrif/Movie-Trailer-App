import 'package:flutter/material.dart';

List MovieListData = [

  {
    "title": "No Time To Die",
    "actor": "James Bond",
    "director" : "Cary Joji Fukunage",
    "releasedDate":"September 30, 2021",
    "rating": "4.7",
    "desc":"James Bond is enjoying a tranquil life in Jamaica after leaving active service. However, his peace is short-lived as his old CIA friend, Felix Leiter, shows up and asks for help. The mission to rescue a kidnapped scientist turns out to be far more treacherous than expected, leading Bond on the trail of a mysterious villain who's armed with a dangerous new technology.",
    "cImages":List1,
    "dImages":dialogList1,
    "movPath":"assets/video.mov"


  },
  {
     "title": "Mad Max",
     "actor": "Max Rockatansky",
     "director" : "George Miller",
     "releasedDate":"May 15, 2015",
    "rating": "4.5",
    "desc":"Taking place in a dystopian Australia in the near future, Mad Max tells the story of a highway patrolman cruising the squalid back roads that have become the breeding ground of criminals foraging for gasoline and scraps.",
    "cImages":List2,
    "dImages":dialogList2,
    "movPath":"assets/trailer.mp4"
  },


];


List<Image> List1 =[
  Image.asset( "assets/images/movie_one_pic1.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic2.jpeg",
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic3.webp",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic4.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic5.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic6.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic7.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic8.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset( "assets/images/movie_one_pic9.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),


];

List<String> dialogList1 = [
  "assets/images/movie_one_pic1.jpeg",

      "assets/images/movie_one_pic2.jpeg",
      "assets/images/movie_one_pic3.webp",

      "assets/images/movie_one_pic4.jpeg",

      "assets/images/movie_one_pic5.jpeg",

      "assets/images/movie_one_pic6.jpeg",

      "assets/images/movie_one_pic7.jpeg",

      "assets/images/movie_one_pic8.jpeg",

      "assets/images/movie_one_pic9.jpeg",

];


List<Image> List2 =[
  Image.asset(   "assets/images/1.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset(  "assets/images/2.jpeg",
      width: 100,
      fit: BoxFit.cover),
  Image.asset(  "assets/images/3.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset(   "assets/images/4.png",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset(   "assets/images/5.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset(   "assets/images/6.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset(   "assets/images/7.jpeg",height: 100,
      width: 100,
      fit: BoxFit.cover),
  Image.asset(   "assets/images/8.jpg",height: 100,
      width: 100,
      fit: BoxFit.cover),

];

List<String> dialogList2 = [
"assets/images/1.jpeg",

"assets/images/2.jpeg",

"assets/images/3.jpeg",

"assets/images/4.png",

"assets/images/5.jpeg",

"assets/images/6.jpeg",

"assets/images/7.jpeg",

"assets/images/8.jpg",

];


