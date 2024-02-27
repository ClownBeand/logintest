import 'package:email_otp/email_otp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:logintest/component/one_button.dart';
import 'package:logintest/component/one_textfield.dart';
import '../component/squire_tile.dart';

const Color backColor = Color.fromARGB(255, 233, 233, 233);

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  EmailOTP myAuth = EmailOTP();
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Icon(Icons.person),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "You're welcome",
                    style: TextStyle(color: Color(0xFF5B5B5B)),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //
              Image.asset(
                'assets/images/Illustration Pack Online Shopping-04.png',
              ),

              const SizedBox(
                height: 16,
              ),

              const Text(
                "Enter Your E-mail",
                style: TextStyle(
                    color: Color(0xFFF2796B),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),

              // e-mail
              Form(
                key: formKey,
                child: OneTextField(
                  controller: emailController,
                  hintText: "Enter Email",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
              ),
              const SizedBox(
                height: 60,
              ),

              OneButton(
                  text: "Sign in",
                  onClicked: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/codepage');
                    }
                  }),
              const SizedBox(
                height: 40,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                      color: Colors.grey[600],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                      color: Colors.grey[600],
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'assets/images/google.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SquareTile(imagePath: 'assets/images/vk.png'),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
