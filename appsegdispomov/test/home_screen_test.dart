import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appsegdispomov/login/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verifica que el mensaje de bienvenida se muestra
    expect(find.text('Bienvenido a SecureMobile'), findsOneWidget);
  });
}
