import 'package:flutter/material.dart';

class MyApplicationsPage extends StatelessWidget {
  final List applications = [
    ['Google', 'Software Engineer', 'Pending'],
    ['Apple', 'UI Designer', 'Accepted'],
    ['Uber', 'Product Manager', 'Rejected'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applications'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: applications.length,
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
                        // Placeholder for company logo (text-based)
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              applications[index][0][0], // First letter of company
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              applications[index][1], // Job Title
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              applications[index][0], // Company Name
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      applications[index][2], // Application Status
                      style: TextStyle(
                        fontSize: 15,
                        color: _getStatusColor(applications[index][2]), // Status Color
                      ),
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

  // Function to return color based on the application status
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
