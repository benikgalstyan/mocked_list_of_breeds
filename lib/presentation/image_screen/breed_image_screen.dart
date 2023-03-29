import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'breed_image_layout.dart';

class BreedScreenImage extends StatelessWidget {
  const BreedScreenImage({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BreedLayoutImg(breed: breed),
    );
  }
}
