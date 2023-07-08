import 'package:favorite_places/models/place.dart';
import 'package:riverpod/riverpod.dart';

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);

  void addPlace(Place place) {
    state = [...state, place];
  }
}

final placeListProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) {
  return PlaceNotifier();
});
