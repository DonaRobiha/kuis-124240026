import 'package:flutter/material.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const PokemonApp());
}


class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Pokemon',

      
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),

      
      home: const LoginPage(),
    );
  }
}