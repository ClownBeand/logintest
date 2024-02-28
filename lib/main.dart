import 'package:flutter/material.dart';
import 'package:logintest/pages/email_page.dart';
import 'pages/id_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EmailPage(),
      routes: {
        '/EmailPage': (context) => const EmailPage(),
        '/idpage': (context) => const IdPage(
              id: '',
            ),
      },
    );
  }
}
