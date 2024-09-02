import 'package:flutter/material.dart';

class HistorialAnalisisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.history, color: Color(0xFF268bd2)),
          title: Text('Escaneo Completo - 05/09/2024'),
          subtitle: Text('Resultados: 2 Amenazas Detectadas'),
        ),
        ListTile(
          leading: Icon(Icons.history, color: Color(0xFF268bd2)),
          title: Text('Escaneo Rápido - 01/09/2024'),
          subtitle: Text('Resultados: Sin Amenazas Detectadas'),
        ),
        // Añade más elementos de historial según sea necesario
      ],
    );
  }
}
