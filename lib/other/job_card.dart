import 'package:flutter/material.dart';

import 'job_detail_page.dart';

class JobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String logo;
  final int hourlyRate;

  JobCard({
    required this.companyName,
    required this.jobTitle,
    required this.logo,
    required this.hourlyRate,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
    child: GestureDetector(
    onTap: () {
    // Navigate to the job detail page when the card is tapped
    Navigator.push(
    context,
      MaterialPageRoute(
        builder: (context) => JobDetailPage(
          jobTitle: jobTitle,
          companyName: companyName,
          location: 'Location', // Replace with actual location
          jobDescription: 'Job Description', // Replace with actual description
          salary: '\$$hourlyRate/hr', // Replace with actual salary
          skills: 'Skill 1, Skill 2', // Replace with actual skills
        ),
      ),
    );
    },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 220,
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).colorScheme.secondary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 60,
                      child: Image.asset(logo),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Theme.of(context).colorScheme.primary,
                      child:  Text(
                        'Part time',
                        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  jobTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text('\$$hourlyRate/hr'),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
