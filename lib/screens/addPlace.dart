import 'package:flutter/material.dart';

class AddPlace extends StatefulWidget {
  const AddPlace({super.key});

  @override
  State<AddPlace> createState() {
    return _AddPlaceState();
  }
}

class _AddPlaceState extends State<AddPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Center(
        child: Text(
          'add here.',
          style:
              Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
