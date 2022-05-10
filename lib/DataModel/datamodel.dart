import 'package:flutter/material.dart';

import '../constants.dart';

class MovieData {
  final String title;
  final String year;
  final String imdb;
  final String smallImage;
  final String largeImage;
  final String description;
  final String hdLink;
  // final String fullHdLink;
  final String hdSize;
  // final String fHdSize;

  MovieData({
    required this.title,
    required this.year,
    required this.imdb,
    required this.smallImage,
    required this.largeImage,
    required this.description,
    required this.hdLink,
    // required this.fullHdLink,
    required this.hdSize,
    // required this.fHdSize,
  });
}

class ImageErrorContainer extends StatelessWidget {
  const ImageErrorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.red,
      child: Center(
        child: Text(
          'Unable to load image.',
          style: kPoppinsStyle.copyWith(fontSize: 30.0),
        ),
      ),
    );
  }
}
