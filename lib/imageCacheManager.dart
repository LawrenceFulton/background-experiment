import 'dart:convert';

import 'package:flutter/cupertino.dart';

/// A class which saves the decoded images so that we dont have to transfer them
/// whenever we rebuild the application
class ImageCacheManager {
  static final Map<String, ImageProvider> _cache = {};

  static ImageProvider get(String base64String) {
    if (!_cache.containsKey(base64String)) {
      _cache[base64String] = MemoryImage(base64Decode(base64String));
    }
    return _cache[base64String]!;
  }
}
