import 'package:flutter/material.dart';
import 'package:mocked_list_of_breeds/data/repository/repository_impl.dart';
import 'package:mocked_list_of_breeds/data/services/network_service_impl.dart';
import 'package:mocked_list_of_breeds/presentation/breed_screen.dart';

void main() {
  runApp(BreedScreen(
    repository: RepositoryImpl(NetworkServiceImpl()),
  ));
}
