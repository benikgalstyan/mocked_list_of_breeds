import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_image_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_image_event.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_image_state.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/data/repository/repository_impl.dart';
import 'package:mocked_list_of_breeds/data/services/network_service_impl.dart';
import 'package:mocked_list_of_breeds/widgets/breed_widget.dart';


class BreedLayoutImg extends StatefulWidget {
  const BreedLayoutImg({Key? key, required this.breed}) : super(key: key);
  final Breed breed;

  @override
  State<BreedLayoutImg> createState() => _BreedLayoutState();

}

class _BreedLayoutState extends State<BreedLayoutImg> {

@override
  void initState() {
  context.read<DogImageBloc>().add(LoadingDogsImageEvent(widget.breed));
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Screen'),
    leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.of(context).pop();},),
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<DogImageBloc, BreedImageState>(
          builder: (context, state) {
            if (state is InitialImageState) {
              return const Center(child: Text("Waiting"));
            } else if (state is LoadingImageState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorImageState) {
              return const Center(child: Text("error"));
            } else if (state is LoadedImageState) {
              return ListView.separated(
                    itemBuilder: (_, index) => Image.network(state.image[index]),
                    separatorBuilder: (_, __) => const Divider(thickness: 4,),
                    itemCount: (state.image.length));
            } else {
              throw Exception('unprocessed state $state in DogListLayout');
            }
          },
        ),
      ),
    );
  }
}


