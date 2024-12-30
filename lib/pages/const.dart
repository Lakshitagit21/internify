import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internify/homepage.dart';
import 'package:internify/pages/about.dart';
import 'package:internify/pages/logout.dart';
import 'package:internify/pages/my_application_page.dart';
import 'package:internify/pages/profile_page.dart';
import 'package:internify/pages/settings_page.dart';

import 'jobs_posted.dart';

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
      child: SingleChildScrollView(
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
                leading: const Icon(Icons.assignment),
                title: const Text(
                  'A P P L I C A T I O N S',
                  style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyApplicationsPage()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child: ListTile(
                leading: const Icon(Icons.business_center), // Icon for job postings
                title: const Text(
                  'J O B P O S T I N G S', // Title for job postings
                  style: TextStyle(
                    color: Color.fromARGB(255, 117, 117, 117), // Gray text color
                  ),
                ),
                onTap: () {
                  // Navigate to Job Postings page
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => JobPostingsPage()),
                  );
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
                              onPressed: () async {
                                Navigator.of(context)
                                    .pop(); // Close the alert dialog

                                // Perform Firebase logout
                                await FirebaseAuth.instance.signOut();

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
      ),
    );
  }
}
