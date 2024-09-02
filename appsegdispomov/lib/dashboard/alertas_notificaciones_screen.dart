import 'package:flutter/material.dart';

class AlertasNotificacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Card(
          color: Color(0xFF073642),
          child: ListTile(
            leading: Icon(Icons.warning, color: Colors.red),
            title: Text('Permiso de Cámara Sospechoso'),
            subtitle: Text('La aplicación XYZ está usando el permiso de cámara de forma sospechosa.'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text('Revocar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF268bd2),
              ),
            ),
          ),
        ),
        // Añade más tarjetas de alerta según sea necesario
      ],
    );
  }
}
