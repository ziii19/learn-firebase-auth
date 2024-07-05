import 'package:flutter/material.dart';

import 'assets.dart';
import 'components/components.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  TextEditingController mailController = TextEditingController();

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
            InputForm(
              controller: mailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Continue',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
