import 'package:favorite_places/screens/addPlace.dart';
import 'package:favorite_places/widget/list_of_places.dart';
import 'package:flutter/material.dart';

class YourPlaces extends StatefulWidget {
  const YourPlaces({super.key});

  @override
  State<YourPlaces> createState() {
    return _YourPlacesState();
  }
}

class _YourPlacesState extends State<YourPlaces> {
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
      body: const ListOfPlaces(),
    );
  }
}
