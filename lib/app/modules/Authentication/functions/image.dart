import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<void>  pickAndUploadImage(String email) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);

    if (file != null) {
      Get.snackbar('Image Selected', 'Now you can save it.');

      try {
        String uniqueFileName =
            DateTime.now().millisecondsSinceEpoch.toString();

        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child("images");
        Reference referenceImageToUpload =
            referenceDirImages.child(uniqueFileName);

        await referenceImageToUpload.putFile(File(file.path));
        String imageUrl =
            await referenceImageToUpload.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('User_Details')
            .where('email', isEqualTo: email)
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            doc.reference.update({'image': imageUrl});
          });
        });

        Get.snackbar(
          'Image Uploaded',
          'Image uploaded successfully!',
        );
      } catch (error) {
        print('Error uploading image: $error');
        Get.snackbar(
          'Error',
          'Failed to upload image. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }
}