import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/presentation/breed_layout.dart';

class BreedScreen extends StatelessWidget {
  const BreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BreedLayout(),
    );
  }
}
