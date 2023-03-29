import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/provider/provider_impl.dart';
import 'package:provider/provider.dart';

class BreedLayoutImg extends StatefulWidget {
  const BreedLayoutImg({super.key, required this.breed});

  final Breed breed;

  @override
  State<BreedLayoutImg> createState() => _BreedLayoutState();
}

class _BreedLayoutState extends State<BreedLayoutImg> {
  late final DataFromApi dataFromApi;

  @override
  void initState() {
    super.initState();
    dataFromApi = Provider.of<DataFromApi>(context, listen: false);
    dataFromApi.getImage(widget.breed);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Dogs Image Screen'),
          ),
          body: Consumer<DataFromApi>(
            builder: (context, provider, child) {
              return ListView.separated(
                itemBuilder: (_, index) =>
                    Image.network(provider.dogImages[index]),
                separatorBuilder: (_, __) => const Divider(
                  thickness: 4,
                ),
                itemCount: (provider.dogImages.length),
              );
            },
          )),
    );
  }
}
