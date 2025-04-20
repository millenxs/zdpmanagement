import 'package:flutter/material.dart';
import 'package:contador_app/translations/app_translations.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('pt', 'BR'); //linguagem padrão

  Locale get currentLocale => _currentLocale;

  final Map<String, Map<String, String>> _translations = {
    'pt_BR': ptBR,
    'en_US': enUS,
    'es_ES': esES,
    'it_IT': itIT,
  };

  String translate(String key) {
    final languageCode =
        '${_currentLocale.languageCode}_${_currentLocale.countryCode}';
    return _translations[languageCode]?[key] ??
        key; // retorna a tradução ou chave se não encontrar
  }

  void setLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
