<<<<<<< HEAD
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PerfilUsuarioScreen extends StatelessWidget {
  final String nombre;
  final String email;

  PerfilUsuarioScreen({
    required this.nombre,
    required this.email,
  });

=======
import 'package:flutter/material.dart';

class PerfilUsuarioScreen extends StatelessWidget {
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
<<<<<<< HEAD
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/mobile.png'),
                backgroundColor: Colors.grey[200],
              ),
              SizedBox(height: 20),
              Text(
                nombre,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                email,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarPerfilScreen(
                        nombre: nombre,
                        email: email,
                      ),
                    ),
                  );
                },
                child: Text('Editar Perfil'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditarPerfilScreen extends StatefulWidget {
  final String nombre;
  final String email;

  EditarPerfilScreen({
    required this.nombre,
    required this.email,
  });

  @override
  _EditarPerfilScreenState createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  XFile? _imagen;

  @override
  void initState() {
    super.initState();
    _nombreController.text = widget.nombre;
    _emailController.text = widget.email;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagen = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: _imagen != null
                    ? FileImage(File(_imagen!.path))
                    : AssetImage('assets/mobile.png') as ImageProvider,
                backgroundColor: Colors.grey[200],
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
              ),
            ),
            SizedBox(height: 20),
            Text(
<<<<<<< HEAD
              'Nombre:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                hintText: 'Nombre del usuario',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Implementar la lógica de guardado de cambios aquí
              },
              child: Text('Guardar Cambios'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: TextStyle(fontSize: 18),
              ),
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
            ),
          ],
        ),
      ),
    );
  }
}