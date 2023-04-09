import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'breed_image_layout.dart';

class BreedScreenImg extends StatelessWidget {
  const BreedScreenImg({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BreedLayoutImg(breed: breed),
    );
  }
}
