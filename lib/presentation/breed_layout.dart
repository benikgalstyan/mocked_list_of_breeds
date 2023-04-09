import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocked_list_of_breeds/business_logic/riverpod/data_provider.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/widgets/breed_widget.dart';

class BreedLayout extends ConsumerWidget {
  const BreedLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(breedsDataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Breed List"),
      ),
      body: _data.when(
          data: (_data) {
            List<Breed> breedList = _data.map((e) => e).toList();
            return ListView.separated(
              itemCount: breedList.length,
              itemBuilder: (_, index) => BreedWidget(breedList[index]),
              separatorBuilder: (_, __) => const Divider(
                color: Colors.grey,
                height: 60,
                thickness: 1,
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
