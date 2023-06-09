import 'package:flutter/material.dart';

class categoryclass {
  categoryclass(
      {required this.id,
      required this.title,
      this.color = Colors.orangeAccent});

  final String id;
  final String title;
  final Color color;
}
