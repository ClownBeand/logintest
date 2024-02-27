import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:logintest/component/one_button.dart';
import 'package:logintest/component/one_textfield.dart';

const Color backColor = Color.fromARGB(255, 233, 233, 233);

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _EmailPageState();
}

class _EmailPageState extends State<CodePage> {
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  @override
  void dispose() {
    codeController.dispose();
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
                "Enter Your Code",
                style: TextStyle(
                    color: Color(0xFFF2796B),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),

              // code
              Form(
                key: formKey,
                child: OneTextField(
                  controller: codeController,
                  hintText: "Enter Code",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (code) =>
                      code != null && !EmailValidator.validate(code)
                          ? 'Enter a valid code'
                          : null,
                ),
              ),
              const SizedBox(
                height: 60,
              ),

              OneButton(
                  text: "Authorization",
                  onClicked: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/codepage');
                    }
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
