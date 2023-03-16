abstract class BreedImageState {}

class InitialImageState extends BreedImageState {}

class LoadingImageState extends BreedImageState {}

class LoadedImageState extends BreedImageState {
  LoadedImageState(this.image);
  final List<String> image;
}

class ErrorImageState extends BreedImageState {
  ErrorImageState(this.error);
  final Object error;
}