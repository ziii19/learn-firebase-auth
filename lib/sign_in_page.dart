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
              controller: mailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            InputPassword(
              controller: passController,
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
              onTap: () {},
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
      ),
    );
  }
}
