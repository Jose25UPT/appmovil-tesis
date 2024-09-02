import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: Color(0xFF002b36), // Azul Oscuro
      scaffoldBackgroundColor: Color(0xFF002b36), // Fondo Principal
      appBarTheme: AppBarTheme(
        color: Color(0xFF073642), // Barras de Navegación: Negro
      ),
      // ignore: prefer_const_constructors
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32, fontWeight: FontWeight.bold), // Textos Principales: Blanco
        bodyLarge: TextStyle(color: Color(0xFF586e75)), // Textos Secundarios: Gris Oscuro
        labelLarge: TextStyle(color: Colors.white), // Botones
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF268bd2), // Botones y Elementos Resaltados: Azul Kali
      ),
    );
  }
}
