import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocked_list_of_breeds/business_logic/riverpod/data_provider.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';

class BreedLayoutImg extends ConsumerWidget {
  const BreedLayoutImg({super.key, required this.breed});

  final Breed breed;

  final nameOfScreen = "Dogs Image Screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(breedsImageProvider(breed));
    return Scaffold(
      appBar: AppBar(
        title: Text(nameOfScreen),
      ),
      body: _data.when(
          data: (_data) {
            List<String> imageList = _data.map((e) => e).toList();
            return ListView.separated(
              itemBuilder: (_, index) => Image.network(imageList[index]),
              itemCount: imageList.length,
              separatorBuilder: (_, __) => const Divider(
                thickness: 4,
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
