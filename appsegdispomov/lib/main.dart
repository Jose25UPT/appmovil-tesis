import 'package:flutter/material.dart';
import 'login/login_screen.dart';
import 'login/register_screen.dart';
import 'dashboard_screen.dart'; // Asegúrate de que esta importación sea correcta
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/dashboard': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map;
          return DashboardScreen(
            username: args['username'],
            profilePictureUrl: args['profilePictureUrl'],
          );
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
