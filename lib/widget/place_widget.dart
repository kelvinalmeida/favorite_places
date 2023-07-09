import 'package:favorite_places/screens/place_details.dart';
import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    void goToDetails() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlaceDetails(title: title),
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: goToDetails,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 20,
              ),
        ),
      ),
    );
  }
}
