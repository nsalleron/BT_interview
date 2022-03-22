import 'dart:typed_data';

import 'package:flutball/core/params/image_request_params.dart';
import 'package:flutball/core/resources/data_state.dart';



abstract class ImageRepository {
  Future<DataState<Uint8List>> getImage(ImageRequestParams params);
}
