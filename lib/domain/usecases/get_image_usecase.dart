import 'dart:typed_data';

import 'package:flutball/core/params/image_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';
import 'package:flutball/data/repositories/image_repository.dart';
import 'package:flutball/domain/usecases/usecase.dart';

class GetImageUseCase implements UseCase<DataState<Uint8List>, ImageRequestParams> {
  GetImageUseCase(this._imageRepository);

  final ImageRepository _imageRepository;

  @override
  Future<DataState<Uint8List>> call(ImageRequestParams params) {
    return _imageRepository.getImage(params);
  }
}
