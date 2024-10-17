import 'package:flutter/services.dart';

class AppPermissions {
  static const MethodChannel _channel = MethodChannel('com.example.apppermissions');

  static Future<Map<String, dynamic>> getPermissions(String packageName) async {
    try {
      final Map<dynamic, dynamic> result = await _channel.invokeMethod('getPermissions', {
        'packageName': packageName,
      });
      return {
        'granted': List<String>.from(result['granted']),
        'denied': List<String>.from(result['denied']),
      };
    } on PlatformException catch (e) {
      print("Error al obtener permisos: ${e.message}");
      return {
        'granted': [],
        'denied': [],
      };
    }
  }
}
