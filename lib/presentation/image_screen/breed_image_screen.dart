import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/cubit/breed_image_cubit.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/data/repository/repository_impl.dart';
import 'package:mocked_list_of_breeds/data/services/network_service_impl.dart';
import 'breed_image_layout.dart';

class BreedScreenImg extends StatelessWidget {
  const BreedScreenImg({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => DogImageCubit(breed,
            repository: RepositoryImpl(NetworkServiceImpl()))
          ..fetchImageApi(),
        child: BreedLayoutImg(breed: breed),
      ),
    );
  }
}
