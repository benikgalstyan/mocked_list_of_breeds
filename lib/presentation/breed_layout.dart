import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocked_list_of_breeds/business_logic/riverpod/data_provider.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/widgets/breed_widget.dart';

class BreedLayout extends ConsumerWidget {
  const BreedLayout({super.key});

  final nameOfScreen = "Dogs List Screen";

  final double heightOption = 60;

  final double thicknessOption = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(breedsDataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Text(nameOfScreen),
      ),
      body: _data.when(
          data: (_data) {
            List<Breed> breedList = _data.map((e) => e).toList();
            return ListView.separated(
              itemCount: breedList.length,
              itemBuilder: (_, index) => BreedWidget(breedList[index]),
              separatorBuilder: (_, __) =>  Divider(
                color: Colors.grey,
                height: heightOption,
                thickness: thicknessOption,
              ),
            );
          },
          error: (error, state) => Text(error.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
