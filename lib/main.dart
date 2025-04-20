import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_app/providers/language_provider.dart';
import 'features/primeira_pagina/primeira_tela.dart';
import 'features/segunda_pagina/segunda_tela.dart';
import 'features/NotificacoesPage/notificacoes_page.dart';
import 'package:contador_app/providers/theme_provider.dart';
import 'package:contador_app/themes/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LanguageProvider, ThemeProvider>(
      builder: (context, langProvider, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My App',
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          locale: langProvider.currentLocale,
          home: const PrimeiraTela(),
          routes: {
            '/primeira': (context) => const PrimeiraTela(),
            '/segunda': (context) => const SegundaTela(),
            '/notificacoes': (context) => const NotificacoesPage(),
          },
        );
      },
    );
  }
}
