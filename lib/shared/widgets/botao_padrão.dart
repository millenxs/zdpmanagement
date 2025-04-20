import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const BotaoPadrao({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple, //cor do fundo
        foregroundColor: Colors.white, // cor do texto
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(texto),
    );
  }
}
