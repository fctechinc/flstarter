import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

enum ImageFileType {
  profile,
}

class MultipartFileGetter {
  String get _fileName =>
      '${type.name}_${id}_${path.split("/").last.split(".").first}.${ext.split('/').last}';

  MultipartFile get httpImage => MultipartFile.fromBytes(
        fieldName,
        image,
        contentType: MediaType.parse(ext),
        filename: _fileName,
      );

  Future<MultipartFile> get pathImage => MultipartFile.fromPath(
        fieldName,
        path,
        contentType: MediaType.parse("multipart/form-data"),
        filename: _fileName,
      );

  final int id;
  final String ext;
  final Uint8List image;
  final ImageFileType type;
  final String fieldName;
  final String path;

  MultipartFileGetter({
    required this.fieldName,
    required this.id,
    required this.ext,
    required this.image,
    required this.type,
    required this.path,
  });
}
