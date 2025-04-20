import 'package:flutter/material.dart';
import 'package:contador_app/extensions/context_extensions.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder: (context, controller, child) {
        return IconButton(
          icon: const Icon(Icons.language),
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () => context.setLocale(const Locale('pt', 'BR')),
          child: const Text('🇧🇷 Português'),
        ),
        MenuItemButton(
          onPressed: () => context.setLocale(const Locale('en', 'US')),
          child: const Text('🇺🇸 English'),
        ),
        MenuItemButton(
          onPressed: () => context.setLocale(const Locale('es', 'ES')),
          child: const Text('🇪🇸 Español'),
        ),
        MenuItemButton(
          onPressed: () => context.setLocale(const Locale('it', 'IT')),
          child: const Text('🇮🇹 Italiano'),
        ),
      ],
    );
  }
}
