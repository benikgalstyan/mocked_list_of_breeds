import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/presentation/breed_screen.dart';
import 'package:mocked_list_of_breeds/provider/provider_impl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DataFromApi()),
      ],
      child: const BreedScreen(),
    ),
  );
}
