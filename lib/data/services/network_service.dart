import 'package:mocked_list_of_breeds/data/model/breed.dart';

abstract class NetworkService {
  Future<List<String>> getImage(Breed breed);

  Future<Map<String, dynamic>> getData();
}
