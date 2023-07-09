import 'package:favorite_places/widget/place_widget.dart';
import 'package:riverpod/riverpod.dart';

class PlaceNotifier extends StateNotifier<List<PlaceWidget>> {
  PlaceNotifier() : super([]);

  void addPlace(PlaceWidget place) {
    state = [...state, place];
  }
}

final placeListProvider =
    StateNotifierProvider<PlaceNotifier, List<PlaceWidget>>((ref) {
  return PlaceNotifier();
});
