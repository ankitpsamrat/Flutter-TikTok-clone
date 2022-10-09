import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/models/user_model.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  //
  //   image picker method

  File? proimg;
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      proimg = File(image.path);
      // return;
      // final img = File(image!.path);
      // this.proimg = img;
    } else {}
  }

  //   user registration method

  Future<void> signUp(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadProPic(image);

        MyUser user = MyUser(
          name: username,
          profilePhoto: downloadUrl,
          email: email,
          uid: credential.user!.uid,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
          'Unable to create an account',
          'Please enter all required fields',
        );
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Error Occurred', e.toString());
    }
  }

  Future<String> _uploadProPic(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageDwnUrl = await snapshot.ref.getDownloadURL();
    return imageDwnUrl;
  }

  // login method

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar('Error logging', 'Please enter currect details');
      }
    } catch (e) {
      Get.snackbar('Error logging', e.toString());
    }
  }
}
