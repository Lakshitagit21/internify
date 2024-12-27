import 'dart:io';
import 'package:flutter/material.dart';

class ApplicantProfilePage extends StatefulWidget {
  final String name;
  final String gender;
  final String designation;
  final String resumeUrl;
  final List<String> skills;
  final String contact;
  final String email;
  final String initialStatus; // The current status of the applicant

  const ApplicantProfilePage({
    Key? key,
    required this.name,
    required this.gender,
    required this.designation,
    required this.resumeUrl,
    required this.skills,
    required this.contact,
    required this.email,
    required this.initialStatus, // Initialize the current status
  }) : super(key: key);

  @override
  _ApplicantProfilePageState createState() => _ApplicantProfilePageState();
}

class _ApplicantProfilePageState extends State<ApplicantProfilePage> {
  late String currentStatus;

  @override
  void initState() {
    super.initState();
    currentStatus = widget.initialStatus; // Initialize with the applicant's current status
  }

  // Method to update status
  void _updateStatus(String newStatus) {
    setState(() {
      currentStatus = newStatus;
    });

    // Here, you can save this updated status to your database or backend
    // For example, calling a backend API to update the status
    // (The backend logic is not shown here, but it would involve sending a request to the server).
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text(
          "Applicants Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            // Name
            _buildProfileField('Name', widget.name, Icons.person),
            const SizedBox(height: 20),
            // Gender
            _buildProfileField('Gender', widget.gender, Icons.transgender),
            const SizedBox(height: 20),
            // Designation
            _buildProfileField('Designation', widget.designation, Icons.work),
            const SizedBox(height: 20),
            // Resume URL
            _buildProfileField('Resume URL', widget.resumeUrl, Icons.link),
            const SizedBox(height: 20),
            // Contact Number
            _buildProfileField('Contact Number', widget.contact, Icons.phone),
            const SizedBox(height: 20),
            // Email
            _buildProfileField('Email', widget.email, Icons.email),
            const SizedBox(height: 20),
            // Skills
            _buildProfileField('Skills', widget.skills.join(", "), Icons.list_alt),
            const SizedBox(height: 20),
            // Status
            Text(
              'Status: $currentStatus',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            // Status Change Dropdown
            DropdownButton<String>(
              value: currentStatus,
              onChanged: (String? newStatus) {
                if (newStatus != null) {
                  _updateStatus(newStatus); // Update the status when changed
                }
              },
              items: <String>['Pending', 'Accepted', 'Rejected']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
