import 'package:mocked_list_of_breeds/data/model/breed.dart';

abstract class Repository {
  Future<List<String>> getImage(Breed breed);

  Future<List<Breed>> getData();
}
