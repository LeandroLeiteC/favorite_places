import 'package:favorite_places/features/list_places/widgets/list_places.dart';
import 'package:favorite_places/features/new_place/view/new_place_view.dart';
import 'package:flutter/material.dart';

class ListPlacesView extends StatelessWidget {
  const ListPlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(NewPlaceView.route());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const ListPlaces(),
    );
  }
}
