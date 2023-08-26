import 'package:flutter/material.dart';

PreferredSizeWidget AppBarWidget(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
  );
}
