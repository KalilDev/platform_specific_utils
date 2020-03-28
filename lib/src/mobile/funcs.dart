import 'package:share/share.dart';
import 'package:flutter/material.dart' show Rect;

bool isWeb() => false;

Future<void> share(String message, Rect origin) => Share.share(message,sharePositionOrigin: origin);

void initializePlatform() => null;