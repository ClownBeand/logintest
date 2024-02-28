import 'package:flutter/material.dart';

const Color backColor = Color.fromARGB(255, 233, 233, 233);

class IdPage extends StatefulWidget {
  final String? id;
  const IdPage({super.key, required this.id});

  @override
  State<IdPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<IdPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Text('Вы успешно авторизованы!'),
              Text('Ваш id: ${widget.id}'),
            ]),
          ),
        ),
      ),
    );
  }
}
