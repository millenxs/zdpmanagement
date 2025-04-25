import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contador_app/extensions/context_extensions.dart';
import 'package:provider/provider.dart';
import 'package:contador_app/providers/theme_provider.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String? firstName;
  String? lastName;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();
      if (doc.exists) {
        setState(() {
          firstName = doc.data()?['firstName'] ?? '';
          lastName = doc.data()?['lastName'] ?? '';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final user = FirebaseAuth.instance.currentUser;
    final bool isLoggedIn = user != null;

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.translateReactive('ZDP Management'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isLoggedIn)
                      IconButton(
                        icon: const Icon(Icons.logout, color: Colors.white),
                        onPressed: () async {
                          final shouldLogout = await showDialog<bool>(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  title: Row(
                                    children: const [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.deepPurple,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Logout'),
                                    ],
                                  ),
                                  content: Text(
                                    context.translateReactive(
                                      'Are you sure you want to logout?',
                                    ),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  actionsPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.grey[700],
                                      ),
                                      onPressed:
                                          () =>
                                              Navigator.of(context).pop(false),
                                      child: Text(
                                        context.translateReactive('Cancel'),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.deepPurple,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      onPressed:
                                          () => Navigator.of(context).pop(true),
                                      child: Text(
                                        context.translateReactive('Logout'),
                                      ),
                                    ),
                                  ],
                                ),
                          );

                          if (shouldLogout == true) {
                            await FirebaseAuth.instance.signOut();
                            if (context.mounted) {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName('/'),
                              );
                              Navigator.pushReplacementNamed(context, '/login');
                            }
                          }
                        },
                      ),
                  ],
                ),
                const SizedBox(height: 16),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLoggedIn
                                ? '$firstName $lastName'
                                : context.translateReactive('Login/Register'),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.2,
                            ),
                          ),
                          if (!isLoggedIn)
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: Text(
                                  context.translateReactive('Login/Register'),
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(context.translateReactive('Home')),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/segunda');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.collections),
                  title: Text(context.translateReactive('Brands')),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/segunda');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.campaign),
                  title: Text(context.translateReactive('Social Media')),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/segunda');
                  },
                ),
                if (isLoggedIn) ...[
                  ListTile(
                    leading: const Icon(Icons.analytics),
                    title: Text(context.translateReactive('Analytics')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/segunda');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.newspaper),
                    title: Text(context.translateReactive('News')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/segunda');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.numbers),
                    title: Text(context.translateReactive('Hashtag')),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/segunda');
                    },
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              title: Text(
                themeProvider.isDarkMode
                    ? context.translateReactive('Dark Mode')
                    : context.translateReactive('Light Mode'),
              ),
              trailing: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color:
                    themeProvider.isDarkMode ? Colors.amber : Colors.grey[700],
              ),
              onTap: () {
                themeProvider.toggleTheme(!themeProvider.isDarkMode);
              },
            ),
          ),
        ],
      ),
    );
  }
}
