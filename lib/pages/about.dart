import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("This app is more than a job portal; it’s a platform built to empower individuals. Whether you’re searching for your first internship, transitioning into a new career path, or exploring new opportunities, Internify is designed to simplify the journey and amplify your success. Created by a passionate B.Tech Computer Science student with a knack for innovation and problem-solving, this app is a blend of creativity and cutting-edge technology. Start your journey to a brighter future today with Internify — where potential meets possibility.",
              style: TextStyle(fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme. inversePrimary,
              ), // TextStyle
            ),
            const SizedBox(height: 50,),
             Text("Made with Love by Lakshita ❤️",
               style: TextStyle(fontWeight: FontWeight.normal,
                 color: Theme.of(context).colorScheme. inversePrimary,),
             ),
          ],
        ),
      ),
    );
  }
}