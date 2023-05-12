import 'package:favorite_places/features/place_details/view/place_details_view.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListPlaces extends ConsumerStatefulWidget {
  const ListPlaces({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListPlacesState();
}

class _ListPlacesState extends ConsumerState<ListPlaces> {
  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);

    Widget content = const Center(
      child: Text(
        "No places added yet",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(places[index].title),
          onTap: () {
            Navigator.of(context).push(PlaceView.route(places[index].title));
          },
        ),
      );
    }

    return content;
  }
}
