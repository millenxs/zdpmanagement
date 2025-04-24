import 'package:flutter/material.dart';
import 'package:contador_app/extensions/context_extensions.dart';
import 'package:provider/provider.dart';
import 'package:contador_app/providers/theme_provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isLoggedIn = false;

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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              innerContext.translateReactive('ZDP Management'),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                    'https://www.gravatar.com/avatar/placeholder?s=200&d=mp',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        isLoggedIn
                                            ? 'Millena Medeiros'
                                            : 'Login/Register',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          height: 1.2,
                                        ),
                                      ),
                                      if (!isLoggedIn)
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 2,
                                          ),
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushNamed(
                                                context,
                                                '/login',
                                              );
                                            },
                                            child: const Text(
                                              'Login/Register',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
