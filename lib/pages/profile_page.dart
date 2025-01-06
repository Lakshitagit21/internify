import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _resumeUrlController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  File? _image; // Store the selected image file
  final ImagePicker _picker = ImagePicker();

  final User? _currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> _loadProfileData() async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        final DocumentSnapshot userProfile = await _firestore
            .collection('users')
            .doc(currentUser.uid)
            .get();

        if (userProfile.exists) {
          final data = userProfile.data() as Map<String, dynamic>;
          _nameController.text = data['name'] ?? '';
          _genderController.text = data['gender'] ?? '';
          _designationController.text = data['designation'] ?? '';
          _resumeUrlController.text = data['resumeUrl'] ?? '';
          _contactController.text = data['contact'] ?? '';
          _emailController.text = currentUser.email ?? '';
          if (data['skills'] is List) {
            _skillsController.text = (data['skills'] as List).join(', ');
          }
        }
      }
    } catch (e) {
      print('Error loading profile data: $e');
    }
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
  Future<void> _saveProfile() async {

    if (_nameController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _designationController.text.isEmpty ||
        _resumeUrlController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _skillsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields!")),
      );
      return;
    }

    if (_currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in!")),
      );
      return;
    }

    try {
      final profileData = {
        'name': _nameController.text,
        'gender': _genderController.text,
        'designation': _designationController.text,
        'resumeUrl': _resumeUrlController.text,
        'contact': _contactController.text,
        'email': _currentUser!.email,
        'skills': _skillsController.text.split(','),
      };

      // Save data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser!.uid)
          .set(profileData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile saved successfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save profile: $e")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    if (_currentUser != null) {
      _emailController.text = _currentUser!.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: _saveProfile,
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
              'Edit Your Profile',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35),
            // photo upload section
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
            // Name
            _buildTextField(
              controller: _nameController,
              label: 'Name',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            // Gender
            _buildTextField(
              controller: _genderController,
              label: 'Gender',
              icon: Icons.transgender,
            ),
            const SizedBox(height: 20),
            // Designation
            _buildTextField(
              controller: _designationController,
              label: 'Designation',
              icon: Icons.work,
            ),
            const SizedBox(height: 20),
            // Resume URL
            _buildTextField(
              controller: _resumeUrlController,
              label: 'Resume URL',
              icon: Icons.link,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 20),
            // Contact Number
            _buildTextField(
              controller: _contactController,
              label: 'Contact Number',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            // Email
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              readOnly: true,
            ),
            const SizedBox(height: 20),
            // Skills
            _buildTextField(
              controller: _skillsController,
              label: 'Skills (comma-separated)',
              icon: Icons.list_alt,
            ),
            const SizedBox(height: 35),
            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Profile',
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
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
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
