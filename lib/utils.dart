library platform_specific_utils;

import 'dart:typed_data';

import 'package:tuple/tuple.dart';

import 'src/mobile/file_get.dart' if (dart.library.html) 'src/web/file_get.dart' as imp;
import 'src/mobile/funcs.dart' if (dart.library.html) 'src/web/funcs.dart' as funcs;
export 'src/mobile/image_provider.dart' if (dart.library.html) 'src/web/image_provider.dart';
Future<Tuple2<Uint8List, String>> getFile() => imp.getFile();
bool isWeb() => funcs.isWeb();