// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_learn/home.dart';
import 'package:firebase_auth_learn/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'assets.dart';
import 'components/components.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '', password = '', name = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    // ignore: unnecessary_null_comparison
    if (password != null &&
        nameController.text != '' &&
        mailController.text != '') {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Registered Successfully',
          style: TextStyle(fontSize: 20.0),
        )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Password provided is to week',
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Account already exist',
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(MainAssets.signUp),
            const SizedBox(height: 16),
            const TextTitle(title: 'Sign Up'),
            const SizedBox(height: 16),
            const TextDesc(
                desc:
                    'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildItem(
                  icon: Image.asset(MainAssets.google),
                  app: 'Google',
                ),
                const BuildItem(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 24.0,
                  ),
                  app: 'Facebook',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const OrWidget(),
            const SizedBox(height: 20),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  InputForm(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    controller: nameController,
                    hintText: 'Name',
                  ),
                  const SizedBox(height: 16),
                  InputForm(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    controller: mailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  InputPassword(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    controller: passController,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            CustomButton(
              text: 'Create Account',
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    name = nameController.text;
                    email = mailController.text;
                    password = passController.text;
                  });
                }
                registration();
              },
            ),
            const SizedBox(height: 25),
            SingInUp(
              action: 'Sign In',
              text: 'Do you have account?',
              onAction: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SignInPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
