import 'package:flutter/material.dart';
import 'package:contador_app/shared/widgets/language_menu.dart';

class AppBarPadrao extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onDrawerButtonPressed;
  final VoidCallback? onNotificationButtonPressed;

  const AppBarPadrao({
    super.key,
    required this.title,
    this.onDrawerButtonPressed,
    this.onNotificationButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder:
            (innerContext) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed:
                  onDrawerButtonPressed ??
                  () {
                    Scaffold.of(innerContext).openDrawer();
                  },
            ),
      ),
      title: Center(child: Text(title)),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: onNotificationButtonPressed,
        ),
        LanguageMenu(),
      ],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
