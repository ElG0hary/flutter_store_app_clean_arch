import 'package:fakeshop/core/services/service_locator.dart';
import 'package:fakeshop/presentation/screens/main_products_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake-Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainProductsScreen(),
    );
  }
}
