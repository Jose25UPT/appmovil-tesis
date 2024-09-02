import 'package:flutter/material.dart';

class ConfiguracionSeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.perm_device_information, color: Color(0xFF268bd2)),
          title: Text('Gestión de Permisos'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.wifi, color: Color(0xFF268bd2)),
          title: Text('Configuraciones de Red'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.lock, color: Color(0xFF268bd2)),
          title: Text('Cifrado y Protección de Datos'),
          onTap: () {},
        ),
      ],
    );
  }
}
