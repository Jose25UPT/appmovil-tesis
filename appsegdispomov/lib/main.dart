import 'package:flutter/material.dart';
import 'login/login_screen.dart';
import 'login/register_screen.dart';
import '/dashboard_screen.dart'; // Ruta para el Dashboard
import 'theme.dart';

void main() {
  runApp(SecureMobileApp());
}

class SecureMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SecureMobile',
      theme: AppTheme.theme,
      initialRoute: '/login', // Cambiado de '/login' a '/home'
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/dashboard': (context) => DashboardScreen(), // Ruta para el Dashboard
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
