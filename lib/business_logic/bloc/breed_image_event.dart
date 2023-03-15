import 'package:mocked_list_of_breeds/data/model/breed.dart';

abstract class DogImageEvent {

}

class LoadingDogsImageEvent extends DogImageEvent {
  Breed breed;
  LoadingDogsImageEvent( this.breed);
}