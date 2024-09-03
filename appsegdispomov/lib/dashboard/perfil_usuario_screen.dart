import 'package:flutter/material.dart';

class PerfilUsuarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user_avatar.png'), // Asegúrate de tener esta imagen
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: Juan Pérez',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 10),
            Text(
              'Email: juan.perez@example.com',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 10),
            Text(
              'Teléfono: +1234567890',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Editar Perfil'),
              onPressed: () {
                // Aquí iría la lógica para editar el perfil
              },
            ),
          ],
        ),
      ),
    );
  }
}