import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter/rendering.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE user_paces(id TEXT PRIMERY KEY, title TEXT, image TEXT)');
    },
    version: 1,
  );

  return db;
}

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');

    final places = data
        .map((row) => Place(
              getId: row['id'] as String,
              title: row['title'] as String,
              image: File(row['image'] as String),
            ))
        .toList();

    state = places;
  }

  void addPlace(title, image) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    Place newPlace = Place(title: title, image: copiedImage);

    state = [...state, newPlace];

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }
}

final placeListProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) {
  return PlaceNotifier();
});
