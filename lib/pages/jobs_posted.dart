import 'package:flutter/material.dart';

import 'applicants_page.dart';

class JobPostingsPage extends StatelessWidget {
  final List jobPostings = [
    ['Google', 'Software Engineer', 'lib/icons/google.png'],
    ['Apple', 'UI Designer', 'lib/icons/apple.png'],
    ['Uber', 'Product Manager', 'lib/icons/uber.png'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Job Postings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jobPostings.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // Job Logo Placeholder
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Image.asset(jobPostings[index][2]), // Using logo from job postings
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobPostings[index][1], // Job Title
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              jobPostings[index][0], // Company Name
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.people, // Icon to view applicants
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Navigate to applicants page (you can define the ApplicantsPage)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ApplicantsPage(jobTitle: jobPostings[index][1]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

