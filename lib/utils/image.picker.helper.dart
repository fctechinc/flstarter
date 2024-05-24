

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:starter/utils/multipart.file.getter.dart';

class PickImage {
  static final _picker = ImagePicker();


  Future<MultipartFileGetter?> getImage({
    required ImageFileType type,
    required int id,
    required String fieldName,
    XFile? file,
  }) async {
    file ??= await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      final bytes = await file.readAsBytes();
      String? mimeType = file.mimeType;
      mimeType ??= lookupMimeType(
        '',
        headerBytes: bytes,
      );

      if (mimeType == null) {
        throw "File type is cannot detected";
      }

      return MultipartFileGetter(
        type: type,
        ext: mimeType,
        image: bytes,
        fieldName: fieldName,
        id: id,
        path: file.path,
      );
    }
    return null;
  }
}
