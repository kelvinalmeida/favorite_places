import 'package:favorite_places/providers/place_list_provider.dart';
import 'package:favorite_places/widget/place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfPlaces extends ConsumerStatefulWidget {
  const ListOfPlaces({super.key});

  @override
  ConsumerState<ListOfPlaces> createState() {
    return _ListOsPlacesState();
  }
}

class _ListOsPlacesState extends ConsumerState<ListOfPlaces> {
  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placeListProvider);

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) => PlaceWidget(place: places[index]),
    );
  }
}
