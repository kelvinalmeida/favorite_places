import 'package:favorite_places/providers/place_list_provider.dart';
import 'package:favorite_places/screens/addPlace.dart';
import 'package:favorite_places/widget/list_of_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourPlaces extends ConsumerStatefulWidget {
  const YourPlaces({super.key});

  @override
  ConsumerState<YourPlaces> createState() {
    return _YourPlacesState();
  }
}

class _YourPlacesState extends ConsumerState<YourPlaces> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(placeListProvider.notifier).loadPlaces();
  }

  void addNewPlace() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPlace(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: addNewPlace,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const ListOfPlaces()),
    );
  }
}
