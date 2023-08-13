import 'package:flutter/material.dart';
import 'package:internify/pages/const.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35.0),
      ),
      //drawer
      drawer: const DrawEr(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          //discover a new path
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

          const SizedBox(
            height: 35,
          ),

          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
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

          //for you job

          const SizedBox(
            height: 35,
          ),

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

          const SizedBox(
            height: 35,
          ),

          // ignore: sized_box_for_whitespace

          Container(
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
                }),
          ),

          //recently added job tiles
          const SizedBox(
            height: 50,
          ),

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

          const SizedBox(
            height: 50,
          ),

          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: ((context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    logo: recentJobs[index][2],
                    hourlyRate: recentJobs[index][3],
                  );
                })),
          ))
        ],
      ),
    );
  }
}
