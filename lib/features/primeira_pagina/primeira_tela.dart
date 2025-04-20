import 'package:flutter/material.dart';
import '../segunda_pagina/segunda_tela.dart';
import 'package:contador_app/extensions/context_extensions.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_foto.jpeg',
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.translateReactive('Hello'),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),

                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SegundaTela(),
                      ),
                    );
                  },
                  child: Text(context.translateReactive('Get Started')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
