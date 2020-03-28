import 'dart:html';
import 'package:flutter/material.dart' show Rect, TargetPlatform;
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

bool isWeb() => true;

Future<void> share(String message, Rect origin) => window.navigator.share({'text': message});

void initializePlatform () {
  if (isWeb()) {
    debugDefaultTargetPlatformOverride = TargetPlatform.android;
    window.onLoad.listen((Event load) => window.navigator.serviceWorker.register('service-worker.js').catchError(()=>print('Could not register service worker!')));
  }
}