import 'package:uuid/uuid.dart';
import 'dart:io';

var uuid = Uuid();

class Place {
  Place({
    required this.title,
    required this.image,
    String? getId,
  }) : id = getId ?? uuid.v1();

  final String id;
  final String title;
  final File image;
}
