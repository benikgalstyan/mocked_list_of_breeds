import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';

import 'breed_image_state.dart';

class DogImageCubit extends Cubit<BreedImageState> {
  DogImageCubit(this.breed, {required this.repository})
      : super(InitialImageState());

  final Repository repository;
  final Breed breed;

  Future<void> fetchImageApi() async {
    emit(LoadingImageState());
    try {
      final image = await repository.getImage(breed);
      emit(LoadedImageState(image));
    } catch (e) {
      emit(ErrorImageState(e));
    }
  }
}
