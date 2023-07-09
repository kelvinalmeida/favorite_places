import 'package:flutter/material.dart';

class Place {
  const Place({
    required this.id,
    required this.name,
  });

  final ValueKey<String> id;
  final String name;
}
