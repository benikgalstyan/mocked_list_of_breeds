import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_image_bloc.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';
import 'package:mocked_list_of_breeds/setup_service_locator.dart';
import 'breed_image_layout.dart';

class BreedScreenImg extends StatelessWidget {
  const BreedScreenImg({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DogImageBloc(getIt<Repository>()),
      child: BreedLayoutImg(
        breed: breed,
      ),
    );
  }
}
