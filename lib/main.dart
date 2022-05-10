import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yts_application/DataModel/datamodel.dart';
import 'package:yts_application/screens/homescreen.dart';
import 'package:yts_application/screens/moviesloading.dart';

import 'DataModel/data.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _gotData = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    for (int pageNumber = 1; pageNumber < 6; pageNumber++) {
      var response = await http.get(
          Uri.parse('https://yts.mx/api/v2/list_movies.json?page=$pageNumber'));
      var jsonData = jsonDecode(response.body);
      for (int movieJson = 0; movieJson < 20; movieJson++) {
        data.add(
          MovieData(
            title: jsonData['data']['movies'][movieJson]['title'],
            year: jsonData['data']['movies'][movieJson]['year'].toString(),
            imdb: jsonData['data']['movies'][movieJson]['rating'].toString(),
            smallImage: jsonData['data']['movies'][movieJson]
                ['medium_cover_image'],
            largeImage: jsonData['data']['movies'][movieJson]
                ['large_cover_image'],
            description: jsonData['data']['movies'][movieJson]
                ['description_full'],
            hdLink: jsonData['data']['movies'][movieJson]['torrents'][0]['url'],
            // fullHdLink: jsonData['data']['movies'][movieJson]['torrents'][1]
            //     ['url'],
            // fHdSize: jsonData['data']['movies'][movieJson]['torrents'][1]
            //         ['size']
            //     .toString(),
            hdSize: jsonData['data']['movies'][movieJson]['torrents'][0]['size']
                .toString(),
          ),
        );
      }
    }
    setState(() {
      _gotData = !_gotData;
    });
  }

  // ['title']
  // ['year']
  // ['large_cover_image']
  // ['small_cover_image']
  // ['rating']
  // ['description_full']
  // 720p
  // ['torrents'][0]['url'],
  // ['torrents'][0]['size'],
  // 1080p
  // ['torrents'][1]['url'],
  // ['torrents'][1]['size'],

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yts Movies",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kScaffoldBackgroundCOlor,
      ),
      routes: {'/': (context) => (_gotData ? HomeScreen() : LoadingPage())},
    );
  }
}
