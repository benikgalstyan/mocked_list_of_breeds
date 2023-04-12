import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocked_list_of_breeds/data/model/breed.dart';
import 'package:mocked_list_of_breeds/data/repository/repository_impl.dart';

final breedsDataProvider = FutureProvider<List<Breed>>((ref)  {
  return ref.watch(dataProvider).getData();
});

final breedsImageProvider =
    FutureProvider.family<List<String>, Breed>((ref, breed)  {
  final repository = ref.read(dataProvider);
  return repository.getImage(breed);
});
