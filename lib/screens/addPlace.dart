import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class AddPlace extends ConsumerWidget {
  const AddPlace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addPlaceList(Place place) {
      ref.read(placeListProvider.notifier).addPlace(place);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(),
                const SizedBox(
                  height: 12,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: (){addPlaceList(place)},
                    child: const Text('Save'),
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
