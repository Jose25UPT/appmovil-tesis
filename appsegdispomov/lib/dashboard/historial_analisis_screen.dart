import 'package:flutter/material.dart';

class HistorialAnalisisScreen extends StatelessWidget {
  final List<Map<String, String>> historial;

  HistorialAnalisisScreen({required this.historial});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Análisis'),
      ),
      body: historial.isEmpty 
        ? Center(child: Text('No hay análisis realizados.')) // Mensaje si no hay historial
        : ListView.builder(
            itemCount: historial.length,
            itemBuilder: (context, index) {
              final analisis = historial[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text('Fecha: ${analisis['fecha']}'),
                  subtitle: Text('Hora: ${analisis['hora']}\nTipo: ${analisis['tipo']}\nResultado: ${analisis['resultado']}'),
                ),
              );
            },
          ),
    );
  }
}
