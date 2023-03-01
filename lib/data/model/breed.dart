class Breed {
  final String breed;
  final String? subBreed;

  Breed(this.breed, {this.subBreed});

  String get fullName => '$breed ${subBreed ?? ''}';

  @override
  String toString() {
    return 'Breed{breed: $breed, subBreed: $subBreed}';
  }
}