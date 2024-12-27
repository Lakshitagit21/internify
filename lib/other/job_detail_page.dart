import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String location;
  final String jobDescription;
  final String salary;
  final String skills;
  final File? logo;

  const JobDetailPage({
    Key? key,
    required this.jobTitle,
    required this.companyName,
    required this.location,
    required this.jobDescription,
    required this.salary,
    required this.skills,
    this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text(
          "Job Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Pop the current page
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            // Job Title
            Text(
              jobTitle,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            // Company Name
            Text(
              companyName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            // Job Location
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  location,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Logo (if available)
            if (logo != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  logo!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),
            // Job Description
            Text(
              jobDescription,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Salary
            Row(
              children: [
                const Icon(Icons.attach_money, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  salary,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Skills
            Row(
              children: [
                const Icon(Icons.list_alt, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  skills,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 35),
            // Apply Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply logic here (e.g., navigating to the Apply page)
                  // Just showing a dialog for now
                  showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: const Text('Application Submitted'),
                      content: const Text('You have successfully applied for this job.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
