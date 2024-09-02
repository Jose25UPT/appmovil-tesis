import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appsegdispomov/login/register_screen.dart';

void main() {
  testWidgets('RegisterScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    // Verifica que el título se muestra
    expect(find.text('Crear Cuenta'), findsOneWidget);

    // Verifica que los campos de texto existen
    expect(find.byType(TextFormField), findsNWidgets(4));

    // Verifica que el botón de registro existe
    expect(find.text('Registrarse'), findsOneWidget);
  });

  testWidgets('Register button triggers navigation to HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RegisterScreen(),
      routes: {
        '/home': (context) => Scaffold(body: Text('Home Screen')),
      },
    ));

    // // Simula la entrada de texto en los campos de registro
    // await tester.enterText(find.byType(TextFormField).at(0, 'username'));
    // await tester.enterText(find.byType(TextFormField).at(1, 'user@example.com'));
    // await tester.enterText(find.byType(TextFormField).at(2, 'password'));
    // await tester.enterText(find.byType(TextFormField).at(3, 'password'));

    // Simula un toque en el botón de registro
    await tester.tap(find.text('Registrarse'));

    // Ejecuta la animación de navegación
    await tester.pumpAndSettle();

    // Verifica que se ha navegado a la pantalla principal
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
