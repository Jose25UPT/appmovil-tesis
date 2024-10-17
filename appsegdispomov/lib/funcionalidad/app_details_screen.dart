import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart'; // Asegúrate de agregar la dependencia
import 'package:appsegdispomov/app_permissions.dart';

class AppDetailsScreen extends StatelessWidget {
  final String packageName;

  AppDetailsScreen({required this.packageName});

  Future<Map<String, dynamic>> _fetchPermissions() async {
    return await AppPermissions.getPermissions(packageName);
  }

  void _openAppSettings(BuildContext context) {
    try {
      final intent = AndroidIntent(
        action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
        data: 'package:$packageName',
      );
      intent.launch().catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al abrir la configuración: $e')),
        );
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _openPermissionSettings(BuildContext context, String permission) {
    final intent = AndroidIntent(
      action: 'android.settings.APPLICATION_DETAILS_SETTINGS',
      data: 'package:$packageName',
    );
    intent.launch().catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al abrir la configuración: $e')),
      );
    });
  }

  String _getPermissionAdvice(String permission, bool isGranted) {
    // Ejemplo básico de sugerencias. Puedes expandir esta lógica con más detalles.
    if (permission.contains('location')) {
      return isGranted
          ? 'Este permiso puede poner en riesgo tu ubicación. Considera desactivarlo.'
          : 'Este permiso es seguro si no quieres compartir tu ubicación.';
    } else if (permission.contains('camera')) {
      return isGranted
          ? 'Este permiso permite el acceso a tu cámara. Asegúrate de que sea necesario.'
          : 'Desactivar este permiso puede mejorar tu privacidad visual.';
    } else {
      return isGranted
          ? 'Este permiso es seguro pero puede exponer información sensible.'
          : 'Es bueno mantenerlo desactivado por seguridad.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Aplicación'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchPermissions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los permisos'));
          }

          final permissions = snapshot.data;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPermissionSection(
                    'Permisos Concedidos',
                    permissions?['granted'],
                    true,
                    context,
                  ),
                  SizedBox(height: 16.0),
                  _buildPermissionSection(
                    'Permisos Denegados',
                    permissions?['denied'],
                    false,
                    context,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _openAppSettings(context),
                    icon: Icon(Icons.settings),
                    label: Text('Modificar Permisos en Configuración'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPermissionSection(
      String title, List<dynamic>? permissions, bool isGranted, BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            permissions != null && permissions.isNotEmpty
                ? Column(
                    children: permissions.map((p) {
                      return ListTile(
                        leading: Icon(
                          Icons.shield,
                          color: isGranted ? Colors.green : Colors.red,
                        ),
                        title: Text(p),
                        subtitle: Text(_getPermissionAdvice(p, isGranted)),
                        trailing: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () => _openPermissionSettings(context, p),
                        ),
                      );
                    }).toList(),
                  )
                : Text(
                    'No hay permisos $title'.toLowerCase(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
