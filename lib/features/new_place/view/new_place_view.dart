import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/provider/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlaceView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const NewPlaceView(),
      );

  const NewPlaceView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewPlaceViewState();
}

class _NewPlaceViewState extends ConsumerState<NewPlaceView> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              style: const TextStyle(
                color: Colors.white,
              ),
              controller: _textController,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ref
                    .read(placesProvider.notifier)
                    .addPlace(Place(title: _textController.text));

                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
