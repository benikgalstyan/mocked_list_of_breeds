import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/cubit/breed_state.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';

class DogListCubit extends Cubit<BreedState> {
  DogListCubit(this.repository) : super(InitialState());

  final Repository repository;

  Future<void> fetchBreedApi() async {
    late final breeds;

    emit(LoadingState());
    try {
      breeds = await repository.getData();
      emit(LoadedState(breeds));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
