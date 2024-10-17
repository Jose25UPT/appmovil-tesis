import 'package:flutter/material.dart';

class AlertasNotificacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas y Notificaciones'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white, // Establecer el color de fondo a blanco
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          // Notificaciones de Escaneo Completo
          _crearNotificacion(
            'Notificación de Escaneo Completo',
            'El escaneo ha finalizado. 1 amenaza detectada.',
            Icons.check_circle,
            Colors.green,
            () {
              // Acción para ver detalles del escaneo
              // Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesEscaneoScreen()));
            },
          ),
          SizedBox(height: 10),

          // Alertas en Tiempo Real
          _crearNotificacion(
            'Alerta de Amenaza Detectada',
            'Se ha detectado una amenaza en la aplicación [Nombre de la App]. ¿Quieres ver más detalles?',
            Icons.warning,
            Colors.red,
            () {
              // Acción para ver detalles de la amenaza
              // Navigator.push(context, MaterialPageRoute(builder: (context) => DetallesAmenazaScreen()));
            },
          ),
          SizedBox(height: 10),

          // Resumen de Seguridad Semanal
          _crearNotificacion(
            'Informe Semanal de Seguridad',
            'Resumen semanal de la actividad de seguridad: 3 escaneos realizados, 2 amenazas detectadas.',
            Icons.insert_chart,
            Colors.blue,
            () {
              // Acción para ver el informe semanal
              // Navigator.push(context, MaterialPageRoute(builder: (context) => InformeSemanalScreen()));
            },
          ),
          SizedBox(height: 10),

          // Recordatorios de Escaneo
          _crearNotificacion(
            'Recordatorio de Escaneo',
            'Es hora de realizar tu escaneo de seguridad semanal.',
            Icons.alarm,
            Colors.orange,
            () {
              // Acción para iniciar el escaneo
              // iniciarEscaneo();
            },
          ),
          SizedBox(height: 10),

          // Notificaciones de Actualización de Aplicaciones
          _crearNotificacion(
            'Actualización de Seguridad',
            'La aplicación [Nombre de la App] necesita una actualización de seguridad.',
            Icons.update,
            Colors.purple,
            () {
              // Acción para ir a la tienda de aplicaciones
              // abrirTiendaDeAplicaciones();
            },
          ),
          SizedBox(height: 10),

          // Alertas de Permisos
          _crearNotificacion(
            'Revisión de Permisos',
            'La aplicación [Nombre de la App] tiene acceso a permisos no necesarios.',
            Icons.lock,
            Colors.teal,
            () {
              // Acción para revisar permisos
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RevisarPermisosScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _crearNotificacion(String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      subtitle: Text(subtitle),
      tileColor: color.withOpacity(0.1),
      onTap: onTap, // Ejecuta la acción al tocar la notificación
    );
  }
}
