import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'applicants_page.dart';

class JobPostingsPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Job Postings'),
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
        ),
        body: const Center(
          child: Text(
            'Please sign in to view your job postings.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ),
      );
    }

    final String currentUserId = currentUser.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Job Postings'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('jobs')
        .where('postedBy', isEqualTo: currentUserId)
        .snapshots(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
    return const Center(
    child: Text(
    'You have not posted any Jobs yet!',
    style: TextStyle(fontSize: 18, color: Colors.grey),
    ),
    );
    }

    final jobPostings = snapshot.data!.docs;

    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: jobPostings.length,
          itemBuilder: (context, index) {
            final job = jobPostings[index];
            final String jobTitle = job['jobTitle'];
            final String firstLetter = jobTitle.isNotEmpty ? jobTitle[0] : '?';

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
                            child: Text(
                              firstLetter.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              jobTitle, // Job Title
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                                job['companyName'], // Company Name
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
                        // Navigate to applicants page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ApplicantsPage(jobTitle: jobTitle),
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
    );
    },
      ),
    );
  }
}

