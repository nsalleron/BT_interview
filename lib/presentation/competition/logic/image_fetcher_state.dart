part of 'image_fetcher_cubit.dart';

@immutable
abstract class ImageFetcherState {}

class ImageFetcherInitial extends ImageFetcherState {}

class ImageFetcherLoadInProgress extends ImageFetcherState {
  
}

class ImageFetcherLoadSuccess extends ImageFetcherState {



  ImageFetcherLoadSuccess({required this.isSvg, required this.imageData});

  final bool isSvg;
  final Uint8List imageData;
}

class ImageFetcherLoadFailed extends ImageFetcherState {}
