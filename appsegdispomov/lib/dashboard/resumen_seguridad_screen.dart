import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Cambiado a fl_chart

class ResumenSeguridadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen de Seguridad'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white, // Fondo blanco
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Resumen de Seguridad',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Tarjetas informativas
              _buildInfoCard('Número de Escaneos Realizados', '5', Colors.blue),
              _buildInfoCard('Número de Amenazas Detectadas', '2', Colors.red),
              _buildInfoCard('Último Escaneo', '12/10/2024', Colors.green),
              SizedBox(height: 20),

              // Gráfico circular
              Text('Porcentaje de Amenazas Detectadas', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: PieChart(
                  PieChartData(
                    sections: _createPieData(), // Llamamos a la función modificada
                    borderData: FlBorderData(show: false),
                    centerSpaceRadius: 40, // Espacio en el centro
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Historial de escaneos
              Text('Historial de Escaneos', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              _buildScanHistoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, Color color) {
    return Card(
      elevation: 4,
      color: color.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  /// Datos de ejemplo para el gráfico circular
  static List<PieChartSectionData> _createPieData() {
    return [
      PieChartSectionData(
        value: 2,
        title: 'Amenazas Detectadas',
        color: Colors.red,
        radius: 50, // Radio del sector
      ),
      PieChartSectionData(
        value: 3,
        title: 'Escaneos Sin Amenazas',
        color: Colors.blue,
        radius: 50, // Radio del sector
      ),
    ];
  }

  Widget _buildScanHistoryList() {
    final scanHistory = [
      '12/10/2024: 1 amenaza detectada',
      '05/10/2024: Sin amenazas',
      '28/09/2024: 1 amenaza detectada',
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: scanHistory.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(scanHistory[index]),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            // Acciones para ver más detalles
          },
        );
      },
    );
  }
}

/// Clase para representar datos de amenazas
class ThreatData {
  final String type;
  final int count;

  ThreatData(this.type, this.count);
}
