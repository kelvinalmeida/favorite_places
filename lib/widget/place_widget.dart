import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    void goToDetails() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlaceDetails(title: place.title),
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: goToDetails,
        title: Text(
          place.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}
