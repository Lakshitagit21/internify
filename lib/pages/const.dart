import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internify/homepage.dart';
import 'package:internify/pages/about.dart';
import 'package:internify/pages/logout.dart';
import 'package:internify/pages/profile_page.dart';
import 'package:internify/pages/settings_page.dart';

class DrawEr extends StatefulWidget {
  const DrawEr({super.key});

  @override
  State<DrawEr> createState() => _DrawErState();
}

class _DrawErState extends State<DrawEr> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.diversity_3,
              size: 64,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'D A S H B O A R D',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'P R O F I L E',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserProfilePage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'S E T T I N G S',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SettingsPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                'A B O U T',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'L O G O U T',
                style: TextStyle(
                  color: Color.fromARGB(255, 117, 117, 117),
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Logout'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the alert dialog
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LogOut()));
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
