import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/cubit/breed_list_cubit.dart';
import 'package:mocked_list_of_breeds/presentation/breed_layout.dart';
import 'package:mocked_list_of_breeds/setup_service_locator.dart';

class BreedScreen extends StatelessWidget {
  const BreedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => DogListCubit(getIt()),
        child: const BreedLayout(),
      ),
    );
  }
}
