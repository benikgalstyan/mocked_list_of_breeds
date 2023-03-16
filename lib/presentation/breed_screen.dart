import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_list_bloc.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';
import 'package:mocked_list_of_breeds/presentation/breed_layout.dart';
import 'package:mocked_list_of_breeds/setup_service_locator.dart';

class BreedScreen extends StatelessWidget {
  const BreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DogListBloc(getIt<Repository>()),
      child: const BreedLayout(),
    );
  }
}
