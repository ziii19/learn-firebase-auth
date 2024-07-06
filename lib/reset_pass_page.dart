import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'assets.dart';
import 'components/components.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  String email = '';
  TextEditingController mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  resetPass() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Successfuly',
            style: TextStyle(fontSize: 18.0),
          )));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            e.message!,
            style: const TextStyle(fontSize: 18.0),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset(MainAssets.signIn),
            const SizedBox(height: 16),
            const TextTitle(title: 'Forget Password'),
            const SizedBox(height: 16),
            const TextDesc(
                desc:
                    'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.'),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: InputForm(
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
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Continue',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    email = mailController.text;
                  });
                  resetPass();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
