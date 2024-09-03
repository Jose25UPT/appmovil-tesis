import 'package:flutter/material.dart';

class ReporteAnalisisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte de Análisis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resumen de Análisis de Seguridad',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            _buildAnalysisItem(context, 'Análisis de Malware', '3 amenazas detectadas', Colors.red),
            _buildAnalysisItem(context, 'Escaneo de Vulnerabilidades', '2 vulnerabilidades encontradas', Colors.orange),
            _buildAnalysisItem(context, 'Revisión de Permisos', 'Todos los permisos están en orden', Colors.green),
            _buildAnalysisItem(context, 'Análisis de Tráfico de Red', 'Sin actividad sospechosa', Colors.green),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ver Reporte Completo'),
              onPressed: () {
                // Aquí iría la lógica para ver el reporte completo
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalysisItem(BuildContext context, String title, String result, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.security, color: color),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(result, style: TextStyle(color: color)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}