import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _setpasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome !',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 15),
              Stack(
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/004/511/281/original/default-avatar-photo-placeholder-profile-picture-vector.jpg',
                    ),
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.add_a_photo),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  myIcon: Icons.email_outlined,
                  myLableText: 'Email',
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _setpasswordController,
                  myIcon: Icons.lock_clock_outlined,
                  myLableText: 'Set Password',
                  toHide: true,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _confirmpasswordController,
                  myIcon: Icons.lock_clock_outlined,
                  myLableText: 'Confirm Password',
                  toHide: true,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _usernameController,
                  myIcon: Icons.person,
                  myLableText: 'Username',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
