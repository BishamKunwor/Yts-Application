import 'package:flutter/material.dart';

import '../constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

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
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 460.0),
            width: double.infinity,
            child: Text(
              'Please Wait.\nMovies are Loading.',
              style: kPoppinsStyle.copyWith(
                  fontSize: 40.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
