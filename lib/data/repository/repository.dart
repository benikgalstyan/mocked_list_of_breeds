import 'package:mocked_list_of_breeds/data/model/breed.dart';

abstract class Repository {
  Future<List<Breed>> getData();
}