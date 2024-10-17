import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fl_chart/fl_chart.dart'; // Cambiado a fl_chart
=======
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6

class ReporteAnalisisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte de Análisis'),
<<<<<<< HEAD
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
                'Reporte de Análisis',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Gráfico de barras
              Text('Tendencia de Amenazas', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    barGroups: _createTrendData(), // Llamamos a la función modificada
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Resumen de amenazas detectadas
              Text('Resumen de Amenazas Detectadas', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              _buildThreatSummary(),
              SizedBox(height: 20),

              // Botón para descargar el reporte
              ElevatedButton(
                onPressed: () {
                  // Función para descargar el reporte en PDF
                },
                child: Text('Descargar Reporte en PDF'),
              ),
            ],
          ),
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
        ),
      ),
    );
  }

<<<<<<< HEAD
  /// Datos de ejemplo para el gráfico de barras
  static List<BarChartGroupData> _createTrendData() {
    return [
      BarChartGroupData(x: 0, barRods: [
        BarChartRodData(toY: 1, color: Colors.blue),
      ]),
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData(toY: 2, color: Colors.blue),
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(toY: 3, color: Colors.blue),
      ]),
    ];
  }

  Widget _buildThreatSummary() {
    final threats = [
      'Malware: 5 incidencias',
      'Virus: 2 incidencias',
      'Spyware: 3 incidencias',
    ];

    return Column(
      children: threats.map((threat) {
        return Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(threat, style: TextStyle(fontSize: 16)),
          ),
        );
      }).toList(),
    );
  }
}

/// Clase para representar datos de tendencia
class TrendData {
  final String month;
  final int count;

  TrendData(this.month, this.count);
}
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
