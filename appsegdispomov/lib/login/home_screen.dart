import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecureMobile'),
      ),
      body: Center(
        child: Text('Bienvenido a SecureMobile', style: Theme.of(context).textTheme.displayLarge),
      ),
    );
  }
}
