import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:intl/intl.dart'; // Para formatear fechas
import 'package:shared_preferences/shared_preferences.dart'; // Importa Shared Preferences
import '/app_permissions.dart'; // Asegúrate de importar tu clase de permisos
import '/funcionalidad/app_details_screen.dart'; // Importa el archivo de la nueva pantalla
import './historial_analisis_screen.dart';

class EscaneoSeguridadScreen extends StatefulWidget {
  @override
  _EscaneoSeguridadScreenState createState() => _EscaneoSeguridadScreenState();
}

class _EscaneoSeguridadScreenState extends State<EscaneoSeguridadScreen> {
  List<Application>? _installedApps;
  List<Map<String, String>> _historial = []; // Lista para guardar el historial

  @override
  void initState() {
    super.initState();
    _loadInstalledApps(); // Cargar las apps instaladas y realizar el escaneo al iniciar
    _loadHistorial(); // Cargar el historial desde SharedPreferences
  }

  // Función que carga el historial de SharedPreferences
  Future<void> _loadHistorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedHistorial = prefs.getStringList('historial');
    
    if (storedHistorial != null) {
      setState(() {
        _historial = storedHistorial.map((item) {
          // Convertir de JSON a Map
          return Map<String, String>.from(jsonDecode(item));
        }).toList();
      });
    }
  }

  // Función que simula el escaneo y guarda los resultados en el historial
  Future<void> _loadInstalledApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );

    // Simulación de resultado de análisis
    String resultado = apps.length > 10 ? 'Sin Amenazas Detectadas' : '1 Amenaza Detectada';
    String tipoAnalisis = 'Completo';
    String fecha = DateFormat('dd/MM/yyyy').format(DateTime.now());
    String hora = DateFormat('HH:mm:ss').format(DateTime.now());

    // Guardar el resultado en el historial
    setState(() {
      _installedApps = apps;
      _historial.add({
        'fecha': fecha,
        'hora': hora,
        'tipo': tipoAnalisis,
        'resultado': resultado,
      });
    });

    // Guardar el historial en SharedPreferences
    _saveHistorial();
  }

  // Función para guardar el historial en SharedPreferences
  Future<void> _saveHistorial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> storedHistorial = _historial.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('historial', storedHistorial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escaneo de Seguridad'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.history), // Icono de historial
            onPressed: () {
              // Navegar a la pantalla del historial y pasar la lista _historial
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistorialAnalisisScreen(historial: _historial),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: _installedApps == null
            ? Center(child: CircularProgressIndicator()) // Muestra un loader mientras carga
            : ListView.builder(
                itemCount: _installedApps!.length,
                itemBuilder: (context, index) {
                  final app = _installedApps![index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.apps), // Puedes ajustar para mostrar íconos reales de las apps
                      title: Text(app.appName),
                      subtitle: Text('Paquete: ${app.packageName}'),
                      trailing: Icon(Icons.info_outline),
                      onTap: () {
                        // Navegar a la pantalla de detalles de la aplicación
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppDetailsScreen(
                              packageName: app.packageName,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
