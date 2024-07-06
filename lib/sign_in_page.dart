// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_learn/home.dart';
import 'package:firebase_auth_learn/services/auth.dart';
import 'reset_pass_page.dart';
import 'sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'assets.dart';
import 'components/components.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email = '', password = '';
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  void userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided by user.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else if (e.code == 'user-disabled') {
        message =
            'The user corresponding to the given email has been disabled.';
      } else if (e.code == 'too-many-requests') {
        message =
            'There have been too many requests from this device. Try again later.';
      } else if (e.code == 'operation-not-allowed') {
        message = 'Email/password accounts are not enabled.';
      } else {
        message = 'An undefined Error happened: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            message,
            style: const TextStyle(fontSize: 18.0),
          )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'An error occurred. Please try again later.',
            style: TextStyle(fontSize: 18.0),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 50),
                Image.asset(MainAssets.signIn),
                const SizedBox(height: 16),
                const TextTitle(title: 'Sign In'),
                const SizedBox(height: 16),
                const TextDesc(
                    desc:
                        'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildItem(
                      onTap: () {
                        Auth().signInWithGoogle(context);
                      },
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
                            return 'Please enter E-mail';
                          }
                          return null;
                        },
                        controller: mailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      InputPassword(
                        controller: passController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetPassPage()));
                        },
                        child: Text(
                          'Forget password?',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0XFF7C8BA0)),
                        )),
                  ],
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Log In',
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        email = mailController.text;
                        password = passController.text;
                      });
                    }
                    userLogin();
                  },
                ),
                const SizedBox(height: 25),
                SingInUp(
                  action: 'Sign Up',
                  text: 'Don’t have account?',
                  onAction: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SignUpPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
