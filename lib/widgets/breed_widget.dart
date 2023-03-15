import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/presentation/image_screen/breed_image_screen.dart';

class BreedWidget extends StatelessWidget {
  const BreedWidget(this.breed, {Key? key,}) : super(key: key);
  final Breed breed;


  @override
  Widget build(BuildContext context) {
    return InkWell( onTap:(){Navigator.push(context,MaterialPageRoute(
        builder: (context) => BreedScreenImg(breed: breed)));
    } ,
      child: Text(
        breed.fullName,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }


}

