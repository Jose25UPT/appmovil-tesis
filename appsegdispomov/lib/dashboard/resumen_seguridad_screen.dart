import 'package:flutter/material.dart';

class ResumenSeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Estado General de Seguridad',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(
            value: 0.7, // Ejemplo de un 70% de seguridad
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF268bd2)),
            backgroundColor: Color(0xFF586e75),
            strokeWidth: 10,
          ),
          SizedBox(height: 20),
          Text(
            '70% Seguro',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Escanear Ahora'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF268bd2),
            ),
          ),
        ],
      ),
    );
  }
}
