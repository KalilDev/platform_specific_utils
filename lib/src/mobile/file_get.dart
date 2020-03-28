import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:platform_specific_utils/src/common.dart' as c;
import 'package:tuple/tuple.dart';

const Map<c.FileType, FileType> abstractToNative = {
  c.FileType.any: FileType.ANY,
  c.FileType.music: FileType.AUDIO,
  c.FileType.image: FileType.IMAGE
};
Future<Tuple2<Uint8List, String>> getFile([c.FileType t]) async {
  try {
    final File f =
        await FilePicker.getFile(type: abstractToNative[t] ?? FileType.IMAGE);
    if (f == null) return null;
    final Uint8List bytes = await f.readAsBytes();
    final String name = f.path.split('/').last;
    return Tuple2(bytes, name);
  } catch (e) {
    return null;
  }
}
