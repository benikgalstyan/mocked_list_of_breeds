import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/presentation/breed_screen.dart';
import 'package:mocked_list_of_breeds/setup_service_locator.dart';


void main() {
  setupServiceLocator();
  runApp(const BreedScreen());
}