import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/presentation/image_screen/breed_image_screen.dart';

class BreedWidget extends StatelessWidget {
  const BreedWidget(this.breed, {super.key});

  final Breed breed;

  void navigation(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BreedScreenImage(breed: breed)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigation(context);
      },
      child: Text(
        breed.fullName,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
