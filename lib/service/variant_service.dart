import 'dart:developer';

import 'package:flutter/material.dart';

import '../enum/app_variant.dart';

class VariantService with ChangeNotifier {
  static final VariantService _instance = VariantService._internal();

  factory VariantService() {
    return _instance;
  }

  VariantService._internal();

  AppVariant _variant = AppVariant.normal;

  AppVariant get variant => _variant;

  void setVariantFromUrl(String url) {
    log('URL: $url');
    if (url.contains('changeSchool')) {
      _variant = AppVariant.changeSchool;
    } else {
      _variant = AppVariant.normal;
    }
    log('Variant: $_variant');

    notifyListeners();
  }
}
