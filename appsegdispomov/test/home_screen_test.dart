import 'package:appsegdispomov/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DashboardScreen(username: '', profilePictureUrl: '',)));

    // Verifica que el mensaje de bienvenida se muestra
    expect(find.text('Bienvenido a SecureMobile'), findsOneWidget);
  });
}
