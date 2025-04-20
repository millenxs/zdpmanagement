import 'package:flutter/material.dart';
import '../segunda_pagina/segunda_tela.dart';
import 'package:contador_app/shared/widgets/botao_padrão.dart';
import 'package:contador_app/extensions/context_extensions.dart';

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.translateReactive('Notifications'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.translateReactive('Notifications')),
            BotaoPadrao(
              texto: context.translateReactive('Back'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SegundaTela()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
