import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_app/providers/language_provider.dart';

extension ContextExtension on BuildContext {
  String translateReactive(String key) {
    return watch<LanguageProvider>().translate(key);
  }

  String translateStatic(String key) {
    return read<LanguageProvider>().translate(key);
  }

  void setLocale(Locale locale) {
    read<LanguageProvider>().setLocale(locale);
  }
}
