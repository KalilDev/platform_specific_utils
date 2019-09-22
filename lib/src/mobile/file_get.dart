import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:tuple/tuple.dart';

Future<Tuple2<Uint8List, String>> getFile() async {
  try {
    final File f = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (f == null) return null;
    final Uint8List bytes = await f.readAsBytes();
    final String name = f.path.split('/').last;
    return Tuple2(bytes, name);
  } catch (e) {
    return null;
  }
}
