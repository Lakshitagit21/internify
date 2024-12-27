import 'package:flutter/material.dart';
import 'package:internify/pages/const.dart';
import 'package:internify/pages/post_job.dart';

import 'other/job_card.dart';
import 'other/recent_job_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    ['Uber', 'UI Designer', 'lib/icons/uber.png', 45],
    ['Google', 'Product Dev', 'lib/icons/google.png', 70],
    ['Apple', 'Software Eng.', 'lib/icons/apple.png', 95],
  ];

  final List recentJobs = [
    ['Nike', 'Web Designer', 'lib/icons/nike.png', 50],
    ['Google', 'Flutter Dev', 'lib/icons/google.png', 75],
    ['Apple', 'Software Eng.', 'lib/icons/apple.png', 95],
    ['Uber', 'UI Designer', 'lib/icons/uber.png', 45],
    ['Nike', 'UI/UX', 'lib/icons/nike.png', 20],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.surface,
        elevation: 0,
        iconTheme:  IconThemeData(color: Theme.of(context).colorScheme.inversePrimary, size: 35.0),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.add, // Plus icon
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              iconSize: 35.0,
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostJobPage()),
                  );
              },
            ),
          ),
        ],
      ),
      drawer: const DrawEr(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            // Discover a new path
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Discover a new Path',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 35),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for an internship..',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      // Add logic here.
                    },
                    child: const Icon(
                      Icons.filter_list,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            // For You
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'For You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 35),
            // Horizontal job cards
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: jobsForYou.length,
                itemBuilder: (context, index) {
                  return JobCard(
                    companyName: jobsForYou[index][0],
                    jobTitle: jobsForYou[index][1],
                    logo: jobsForYou[index][2],
                    hourlyRate: jobsForYou[index][3],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            // Recently Added
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Recently Added',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Recently added jobs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recentJobs.length,
                itemBuilder: (context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    logo: recentJobs[index][2],
                    hourlyRate: recentJobs[index][3],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}