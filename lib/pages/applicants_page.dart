import 'package:flutter/material.dart';

import '../other/applicants_profile_page.dart';


class ApplicantsPage extends StatefulWidget {
  final String jobTitle;

  ApplicantsPage({required this.jobTitle});

  @override
  _ApplicantsPageState createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage> {
  // Sample list of applicants
  final List<Map<String, dynamic>> applicants = [
    {
      'name': 'John Doe',
      'gender': 'Male',
      'designation': 'Software Engineer',
      'skills': ['Flutter', 'Dart', 'Java'],
      'resumeUrl': 'https://www.example.com/resume1.pdf',
      'contact': '123-456-7890',
      'email': 'john.doe@example.com',
      'status': 'Pending',
    },
    {
      'name': 'Jane Smith',
      'gender': 'Female',
      'designation': 'UI/UX Designer',
      'skills': ['Figma', 'Sketch', 'Adobe XD'],
      'resumeUrl': 'https://www.example.com/resume2.pdf',
      'contact': '987-654-3210',
      'email': 'jane.smith@example.com',
      'status': 'Accepted',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants for ${widget.jobTitle}'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: applicants.length,
          itemBuilder: (context, index) {
            final applicant = applicants[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the applicant's full profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApplicantProfilePage(
                        name: applicant['name'],
                        gender: applicant['gender'],
                        designation: applicant['designation'],
                        resumeUrl: applicant['resumeUrl'],
                        skills: List<String>.from(applicant['skills']),
                        contact: applicant['contact'],
                        email: applicant['email'],
                        initialStatus: applicant['status'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border.all(color: Theme.of(context).colorScheme.tertiary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            applicant['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            applicant['status'],
                            style: TextStyle(
                              color: _getStatusColor(applicant['status']),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper function to change status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return Colors.orange; // Pending color
      case 'Accepted':
        return Colors.green; // Accepted color
      case 'Rejected':
        return Colors.red; // Rejected color
      default:
        return Colors.black;
    }
  }
}
