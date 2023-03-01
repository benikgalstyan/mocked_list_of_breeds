import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';

class BreedWidget extends StatelessWidget {
  const BreedWidget(this.breed, {Key? key,}) : super(key: key);
  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return Text(
      breed.fullName,
      style: const TextStyle(fontSize: 30),
    );
  }


}