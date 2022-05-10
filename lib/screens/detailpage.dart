import 'package:flutter/material.dart';
import 'package:yts_application/DataModel/datamodel.dart';
import 'package:yts_application/constants.dart';

class DetailedPage extends StatelessWidget {
  const DetailedPage({Key? key, required this.movieDetails}) : super(key: key);

  final movieDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.0),
          child: ListView(
            children: [
              Container(
                height: 400.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withAlpha(50), blurRadius: 30.0)
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.0),
                  child: Image.network(
                    movieDetails.largeImage,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return ImageErrorContainer();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                movieDetails.title,
                style: kPoppinsStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
                // maxLines: 1,
              ),
              SizedBox(
                height: 20.0,
              ),
              QualityButtons(
                size: movieDetails.hdSize,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Description',
                style: kPoppinsStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
                // maxLines: 1,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                movieDetails.description,
                style: kPoppinsStyle.copyWith(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QualityButtons extends StatelessWidget {
  final size;
  const QualityButtons({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(25), blurRadius: 20.0)
          ],
          color: Colors.white.withAlpha(80),
          borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
      child: Text(
        '$size',
        style:
            kPoppinsStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
