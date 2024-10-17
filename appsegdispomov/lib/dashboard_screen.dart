import 'package:flutter/material.dart';
import './dashboard/escaneo_seguridad_screen.dart';
import './dashboard/alertas_notificaciones_screen.dart';
import './dashboard/resumen_seguridad_screen.dart';
import './dashboard/perfil_usuario_screen.dart';
import './dashboard/reporte_analisis_screen.dart';

class DashboardScreen extends StatelessWidget {
<<<<<<< HEAD
  final String username;
  final String profilePictureUrl;

  DashboardScreen({
    required this.username,
    required this.profilePictureUrl,
  });

=======
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
<<<<<<< HEAD
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
=======
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
<<<<<<< HEAD
                  builder: (context) => PerfilUsuarioScreen(nombre: username, email: '',),
=======
                  builder: (context) => PerfilUsuarioScreen(),
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
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
<<<<<<< HEAD
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: profilePictureUrl.isNotEmpty
                      ? NetworkImage(profilePictureUrl)
                      : AssetImage('assets/mobile.png') as ImageProvider,
                  onBackgroundImageError: (_, __) {
                    print('Error al cargar la imagen de perfil.');
                  },
                ),
                SizedBox(width: 12),
                Text(
                  'Bienvenido, $username',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildDashboardButton(
                    context,
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
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
<<<<<<< HEAD
                   
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
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
<<<<<<< HEAD
=======
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
>>>>>>> a90086a6a9618588b1e04989fa68c4ad48d8f0b6
      ),
    );
  }

  Widget _buildDashboardButton(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
