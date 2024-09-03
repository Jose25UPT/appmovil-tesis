import 'package:flutter/material.dart';
import './dashboard/historial_analisis_screen.dart';
import './dashboard/escaneo_seguridad_screen.dart';
import './dashboard/alertas_notificaciones_screen.dart';
import './dashboard/configuracion_seguridad_screen.dart';
import './dashboard/resumen_seguridad_screen.dart';
import './dashboard/perfil_usuario_screen.dart';
import './dashboard/reporte_analisis_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfilUsuarioScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenido, [Nombre del Usuario]',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.blue),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildDashboardButton(
                    context,
                    Icons.analytics,
                    'Historial de Análisis',
                    Colors.blue,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HistorialAnalisisScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardButton(
                    context,
                    Icons.security,
                    'Escaneo de Seguridad',
                    Colors.green,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EscaneoSeguridadScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardButton(
                    context,
                    Icons.notifications,
                    'Alertas y Notificaciones',
                    Colors.red,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlertasNotificacionesScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardButton(
                    context,
                    Icons.settings,
                    'Configuración de Seguridad',
                    Colors.purple,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfiguracionSeguridadScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardButton(
                    context,
                    Icons.assessment,
                    'Resumen de Seguridad',
                    Colors.orange,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResumenSeguridadScreen(),
                        ),
                      );
                    },
                  ),
                  _buildDashboardButton(
                    context,
                    Icons.bar_chart,
                    'Reporte de Análisis',
                    Colors.teal,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReporteAnalisisScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardButton(BuildContext context, IconData icon, String label, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}