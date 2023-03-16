import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_image_event.dart';
import 'package:mocked_list_of_breeds/business_logic/bloc/breed_image_state.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';

class DogImageBloc extends Bloc<DogImageEvent, BreedImageState> {
  final Repository repository;

  DogImageBloc(this.repository) : super(InitialImageState()) {
    on<LoadingDogsImageEvent>((event, emit) async {
      emit(LoadingImageState());
      try {
        final image = await repository.getImage(event.breed);
        emit(LoadedImageState(image));
      } catch (e) {
        emit(ErrorImageState(e));
      }
    });
  }
}
