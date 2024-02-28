import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:logintest/component/one_button.dart';
import 'package:logintest/component/one_textfield.dart';
import 'package:logintest/pages/id_page.dart';

const Color backColor = Color.fromARGB(255, 233, 233, 233);

class CodePage extends StatefulWidget {
  CodePage({super.key, required this.myAuth});
  EmailOTP myAuth = EmailOTP();
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
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/images/User.png",
                    ),
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
                  validator: (codeController) =>
                      widget.myAuth.verifyOTP(otp: codeController) == true
                          ? 'Enter a valid code'
                          : null,
                ),
              ),
              const SizedBox(
                height: 60,
              ),

              OneButton(
                text: "Verify",
                onTap: () async {
                  if (await widget.myAuth.verifyOTP(otp: codeController.text) ==
                      true) {
                    String? id = 'bib';
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IdPage(id: id)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid OTP"),
                    ));
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
