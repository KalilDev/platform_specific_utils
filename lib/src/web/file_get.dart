import 'dart:html';
import 'dart:typed_data';

import 'package:platform_specific_utils/src/common.dart';
import 'package:tuple/tuple.dart';

const Map<FileType, String> abstractToNative = {
  FileType.any: '',
  FileType.music: 'audio/*',
  FileType.image: 'image/*'
};
Future<Tuple2<Uint8List, String>> getFile([FileType t]) async {
  final list = querySelector('#fileInput').children;
  final input = FileUploadInputElement();
  input.hidden = true;
  input.accept = abstractToNative[t] ?? abstractToNative[FileType.image];
  list.add(input);
  input.click();
  await input.onChange.first;
  if (input.files.length == 0) {
    input.remove();
    return null;
  }
  final String name = input.files.first.name;
  final reader = FileReader();
  final result = reader.onLoad.first;
  reader.readAsArrayBuffer(input.files.first);
  await result;
  input.remove();
  return Tuple2(reader.result as Uint8List, name);
}
