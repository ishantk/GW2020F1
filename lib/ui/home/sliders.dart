import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/auriai-165008.appspot.com/o/chole-bhature.png?alt=media&token=785359e0-91e9-432d-9b02-e6f6b6e1e798',
  'https://firebasestorage.googleapis.com/v0/b/auriai-165008.appspot.com/o/r3.jpeg?alt=media&token=50361548-52a7-4730-876c-84e8a1117f9b',
  'https://firebasestorage.googleapis.com/v0/b/auriai-165008.appspot.com/o/biryani.png?alt=media&token=728952f8-5294-4d6c-abd9-e2f6cea21ba9',
  'https://firebasestorage.googleapis.com/v0/b/auriai-165008.appspot.com/o/r2.jpeg?alt=media&token=65f56b51-40d7-4bb5-bf8f-93ad2f98d961',
];

final List<String> imgTitles = [
  'Offer1',
  'Offer2',
  'Offer3',
  'Offer4',
];


final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(
                  imgTitles[imgList.indexOf(item)],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
    ),
  ),
)).toList();

class HomePageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ],)
      );
  }
}