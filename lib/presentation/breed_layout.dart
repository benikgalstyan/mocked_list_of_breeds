import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/provider/provider_impl.dart';
import 'package:mocked_list_of_breeds/widgets/breed_widget.dart';
import 'package:provider/provider.dart';

class BreedLayout extends StatefulWidget {
  const BreedLayout({super.key});

  @override
  State<BreedLayout> createState() => _BreedLayoutState();
}

class _BreedLayoutState extends State<BreedLayout> {
  final nameOfScreen = "Dogs List Screen";

  final double heightOption = 60;

  final double thicknessOption = 1;

  late final DataFromApi dataFromApi;

  late final Breed breed;

  @override
  void initState() {
    super.initState();
    dataFromApi = Provider.of<DataFromApi>(context, listen: false);
    dataFromApi.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
        backgroundColor: Colors.black,
      ),
      body: Consumer<DataFromApi>(
        builder: (context, provider, child) {
          if (provider.newDogList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: provider.newDogList.length,
            itemBuilder: (_, index) => BreedWidget(
              provider.newDogList[index],
            ),
            separatorBuilder: (_, __) => Divider(
              color: Colors.grey,
              height: heightOption,
              thickness: thicknessOption,
            ),
          );
        },
      ),
    );
  }
}
