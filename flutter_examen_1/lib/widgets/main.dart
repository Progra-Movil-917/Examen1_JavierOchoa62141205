import 'package:flutter/material.dart';
import 'package:flutter_examen_1/core/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Libros Stephen King',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
