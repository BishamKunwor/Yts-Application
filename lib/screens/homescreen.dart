import 'package:flutter/material.dart';
import 'package:yts_application/DataModel/data.dart';
import 'package:yts_application/DataModel/datamodel.dart';
import 'package:yts_application/constants.dart';
import 'package:yts_application/screens/detailpage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(80),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(600.0)),
            ),
            height: 400,
            child: Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Text(
                'Movies Lists',
                style: kPoppinsStyle.copyWith(
                    fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120, left: 16.0, right: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: GridView.builder(
                addAutomaticKeepAlives: true,
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 40.0,
                  crossAxisSpacing: 20.0,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, count) {
                  return ImageContainer(
                    details: data[count],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({Key? key, required this.details}) : super(key: key);
  final details;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedPage(
                      movieDetails: details,
                    )));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 24.0),

          color: Colors.white.withAlpha(80),

          // height: 240,
          // width: 135,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    details.smallImage,
                    // height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return ImageErrorContainer();
                    },
                  ),
                ),
              ),
              Text(
                '      ${details.title}',
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    details.year,
                    style: kPoppinsStyle,
                  ),
                  Text(
                    details.imdb,
                    style: kPoppinsStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
