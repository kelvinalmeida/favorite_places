import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_list_provider.dart';
import 'package:favorite_places/widget/place_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() {
    return _AddPlaceSatate();
  }
}

class _AddPlaceSatate extends ConsumerState<AddPlace> {
  final titleControler = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    void backPage() {
      Navigator.of(context).pop();
    }

    void addPlaceList() {
      if (_formKey.currentState!.validate()) {
        ref.watch(placeListProvider.notifier).addPlace(
              Place(
                title: titleControler.text,
              ),
            );
        // print(ref.watch(placeListProvider));
        backPage();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.titleSmall,
                  cursorColor: Colors.red,
                  controller: titleControler,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Write something!';
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  TextButton(
                    onPressed: backPage,
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: addPlaceList,
                    child: const Text('Save Place!'),
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
