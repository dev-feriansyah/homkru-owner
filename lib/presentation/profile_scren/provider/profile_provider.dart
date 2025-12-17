import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController(
    text: 'sarah.johnson@example.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+1 (555) 123-4567',
  );
  final TextEditingController _addressController = TextEditingController(
    text: '123 Main Street Anytown, ST 12345',
  );
  final TextEditingController _householdController = TextEditingController(
    text: 'Household Name',
  );
  final TextEditingController _planController = TextEditingController(
    text: 'Premium Plan',
  );

  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get addressController => _addressController;
  TextEditingController get householdController => _householdController;
  TextEditingController get planController => _planController;

  bool _isEditing = false;
  bool get isEditing => _isEditing;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  final ImagePicker _imagePicker = ImagePicker();

  void changeEditing() {
    _isEditing = !isEditing;
    notifyListeners();
  }

  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (image != null) {
        _selectedImage = File(image.path);
        notifyListeners();
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );

      if (image != null) {
        _selectedImage = File(image.path);
        notifyListeners();
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
    }
  }

  void removeSelectedImage() {
    _selectedImage = null;
    notifyListeners();
  }
}
