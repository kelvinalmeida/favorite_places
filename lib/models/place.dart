import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Place {
  Place({required this.title}) : id = uuid.v1();

  final String id;
  final String title;
}
