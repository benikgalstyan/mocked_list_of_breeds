import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';
import 'package:mocked_list_of_breeds/data/services/network_service.dart';

class RepositoryImpl implements Repository {
  final NetworkService networkService;

  RepositoryImpl(this.networkService);

  @override
  Future<List<Breed>> getData() async {
    final messageMap = await networkService.getData();
    final dogMainBreeds = messageMap.keys.toList();
    final myDogsList = <Breed>[];
    for (var d in dogMainBreeds) {
      List putSubBreeds = messageMap[d];
      if (putSubBreeds.isEmpty) {
        myDogsList.add(Breed(d));
      } else {
        for (var s in putSubBreeds) {
          myDogsList.add(Breed(d, subBreed: s));
        }
      }
    }
    return myDogsList;
  }
}