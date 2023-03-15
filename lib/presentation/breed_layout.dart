import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_event.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_list_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_state.dart';
import 'package:mocked_list_of_breeds/widgets/breed_widget.dart';
import 'package:mocked_list_of_breeds/data/repository/repository_impl.dart';
import 'package:mocked_list_of_breeds/data/services/network_service_impl.dart';
import 'package:mocked_list_of_breeds/widgets/breed_widget_error.dart';

class BreedLayout extends StatefulWidget {
  const BreedLayout({super.key});

  @override
  State<BreedLayout> createState() => _BreedLayoutState();
}

class _BreedLayoutState extends State<BreedLayout> {
  final repo = RepositoryImpl(NetworkServiceImpl());

  @override
  void initState() {
    context.read<DogListBloc>().add(LoadingDogsEvent());
    super.initState();
  }

  final nameOfScreen = "Dogs List Screen";

  final double heightOption = 60;

  final double thicknessOption = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(nameOfScreen),
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<DogListBloc, BreedState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(child: Text("Waiting"));
            } else if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return BreedError(textError: 'Exception $state in DogListScreen');
            } else if (state is LoadedState) {
              return ListView.separated(
                  itemBuilder: (_, index) =>
                      BreedWidget(state.breedList[index]),
                  separatorBuilder: (_, __) => const Divider(
                        thickness: 4,
                      ),
                  itemCount: (state.breedList.length));
            } else {
              throw Exception('unprocessed state $state in DogListLayout');
            }
          },
        ),
      ),
    );
  }
}
