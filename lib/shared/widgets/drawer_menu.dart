import 'package:flutter/material.dart';
import 'package:contador_app/extensions/context_extensions.dart';
import 'package:provider/provider.dart';
import 'package:contador_app/providers/theme_provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Builder(
        builder:
            (innerContext) => Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          innerContext.translateReactive('ZDP Management'),
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.home),
                        title: Text(innerContext.translateReactive('Home')),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/segunda');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.analytics),
                        title: Text(
                          innerContext.translateReactive('Analytics'),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/segunda');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.collections),
                        title: Text(innerContext.translateReactive('Brands')),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/segunda');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.newspaper),
                        title: Text(innerContext.translateReactive('News')),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/segunda');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.campaign),
                        title: Text(
                          innerContext.translateReactive('Social Media'),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/segunda');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.numbers),
                        title: Text(innerContext.translateReactive('Hashtag')),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/segunda');
                        },
                      ),
                      const Divider(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ListTile(
                    title: Text(
                      themeProvider.isDarkMode
                          ? innerContext.translateReactive('Dark Mode')
                          : innerContext.translateReactive('Light Mode'),
                    ),
                    trailing: Icon(
                      themeProvider.isDarkMode
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      color:
                          themeProvider.isDarkMode
                              ? Colors.amber
                              : Colors.grey[700],
                    ),
                    onTap: () {
                      themeProvider.toggleTheme(!themeProvider.isDarkMode);
                    },
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
