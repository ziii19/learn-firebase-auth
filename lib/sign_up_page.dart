import 'package:flutter/material.dart';

import 'assets.dart';
import 'components/components.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            InputForm(
              controller: nameController,
              hintText: 'Name',
            ),
            const SizedBox(height: 16),
            InputForm(
              controller: mailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            InputPassword(
              controller: passController,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Create Account',
              onTap: () {},
            ),
            const SizedBox(height: 25),
            SingInUp(
              action: 'Sign In',
              text: 'Do you have account?',
              onAction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
