import 'package:flutter/services.dart';

class NetworkService {
  static const platform = MethodChannel('com.example.apppermissions');

  Future<List<String>> scanNetwork(String subnet) async {
    try {
      final List<String> devices = await platform.invokeMethod('scanNetwork', {'subnet': subnet});
      return devices;
    } on PlatformException catch (e) {
      print("Error: '${e.message}'.");
      return [];
    }
  }
}
