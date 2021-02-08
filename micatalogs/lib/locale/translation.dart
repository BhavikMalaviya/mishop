

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:micatalogs/locale/translation_strings.dart';


class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar', 'es', 'gu', 'hi', 'id', 'fr'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) => Translations.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}