import 'package:flutter/material.dart';
import 'package:movie_search/keranjang.dart';
import 'package:movie_search/profile.dart';
import 'package:movie_search/wishlist.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'detailProduct.dart';
import 'inspiration.dart';
import 'sliverApp.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
      home: HomeII(),
    );
  }
}
