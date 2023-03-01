import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_event.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_state.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';


class DogListBloc extends Bloc<DogEvent, BreedState> {
  DogListBloc(this.repository) : super(InitialState())  {

    on<LoadingDogsEvent>((event, emit) async  {
      late final breeds;
      try{
        emit(LoadingState());
        breeds =  await repository.getData();
      }
      catch(e){
        emit(ErrorState(e));
      }
      emit(LoadedState(breeds));
    });
  }
  final Repository repository;
}