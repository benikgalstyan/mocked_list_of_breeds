import 'package:mocked_list_of_breeds/data/model/breed.dart';

abstract class BreedState {

}

class InitialState extends BreedState {

}

class LoadingState extends BreedState {

}

class LoadedState extends BreedState {
  LoadedState(this.breedList);
  final List<Breed> breedList;
}

class ErrorState extends BreedState {
  ErrorState(this.error);
  final Object  error;

}