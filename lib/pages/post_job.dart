import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostJobPage extends StatefulWidget {
  const PostJobPage({Key? key}) : super(key: key);

  @override
  State<PostJobPage> createState() => _PostJobPageState();
}

class _PostJobPageState extends State<PostJobPage> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _jobDescriptionController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  File? _image; // Store the selected image file
  final ImagePicker _picker = ImagePicker();

  bool _isLoading = false;

  Future<void> _postJob() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in to post a job.')),
      );
      return;
    }

    if (_jobTitleController.text.isEmpty ||
        _companyNameController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _jobDescriptionController.text.isEmpty ||
        _salaryController.text.isEmpty ||
        _skillsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final jobData = {
        'jobTitle': _jobTitleController.text.trim(),
        'companyName': _companyNameController.text.trim(),
        'location': _locationController.text.trim(),
        'jobDescription': _jobDescriptionController.text.trim(),
        'salary': _salaryController.text.trim(),
        'skills': _skillsController.text.trim().split(','),
        'postedBy': currentUser.uid,
        'postedAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('jobs').add(jobData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Job posted successfully!')),
      );

      // Clear the fields
      _jobTitleController.clear();
      _companyNameController.clear();
      _locationController.clear();
      _jobDescriptionController.clear();
      _salaryController.clear();
      _skillsController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to post job: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _jobTitleController.dispose();
    _companyNameController.dispose();
    _locationController.dispose();
    _jobDescriptionController.dispose();
    _salaryController.dispose();
    _skillsController.dispose();
    super.dispose();
  }


  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text(
          "Add Job Opening",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Pop the current page
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: _isLoading ? null : _postJob,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            // Title
            const Text(
              'Post a Job Opening',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35),

            // Logo upload section
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                  ),
                )
                    : const Center(
                  child: Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildTextField(
              controller: _jobTitleController,
              label: 'Job Title',
              icon: Icons.work,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _companyNameController,
              label: 'Company Name',
              icon: Icons.business,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _locationController,
              label: 'Location',
              icon: Icons.location_on,
            ),
            const SizedBox(height: 20),
// Add more fields for logo upload (consider using an image picker package)
            _buildTextField(
              controller: _jobDescriptionController,
              label: 'Job Description',
              icon: Icons.description,
              keyboardType: TextInputType.multiline,
              maxLines: null, // Allow multiline input
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _salaryController,
              label: 'Salary/Pay',
              icon: Icons.attach_money,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: _skillsController,
              label: 'Skills needed (comma-separated)',
              icon: Icons.list_alt,
            ),
            const SizedBox(height: 35),
            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: _isLoading ? null : _postJob,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'Post Job',
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,  int? maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
