import 'package:flutter/material.dart';

const Color backColor = Color.fromARGB(255, 233, 233, 233);

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _EmailPageState();
}

class _EmailPageState extends State<CodePage> {
  final formKey = GlobalKey<FormState>();

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
              ),
              //
              Image.asset(
                'assets/images/Illustration Pack Online Shopping-04.png',
              ),

              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text('ВАШ ID:'),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
