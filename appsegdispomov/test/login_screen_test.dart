import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appsegdispomov/login/login_screen.dart';

void main() {
  testWidgets('LoginScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Verifica que el título se muestra
    expect(find.text('Inicio de Sesión'), findsOneWidget);

    // Verifica que los campos de correo y contraseña existen
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verifica que el botón de inicio de sesión existe
    expect(find.text('Iniciar Sesión'), findsOneWidget);
  });

  testWidgets('Login button triggers navigation to HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
      routes: {
        '/home': (context) => Scaffold(body: Text('Home Screen')),
      },
    ));

    // Simula la entrada de texto en el campo de correo y contraseña
    await tester.enterText(find.byType(TextFormField).first, 'user@example.com');
    await tester.enterText(find.byType(TextFormField).last, 'password');

    // Simula un toque en el botón de inicio de sesión
    await tester.tap(find.text('Iniciar Sesión'));

    // Ejecuta la animación de navegación
    await tester.pumpAndSettle();

    // Verifica que se ha navegado a la pantalla principal
    expect(find.text('Home Screen'), findsOneWidget);
  });
}
