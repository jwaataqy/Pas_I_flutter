import 'package:flutter/material.dart';

final ScrollController _scrollController = ScrollController();

@override
void initState() {
_scrollController.addListener(() {
  double pixels = _scrollController.position.pixels;
  // Lakukan sesuatu berdasarkan nilai pixels, seperti mengubah warna AppBar, dsb.
  print('Scroll position: $pixels');
});

}


