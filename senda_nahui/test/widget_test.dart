import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:senda_nahui/screens/legacy/login_screen.dart';

void main() {
  testWidgets('Login screen shows Naomi avatar and start button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verifica que exista el botón de 'Iniciar'
    expect(find.text('Iniciar'), findsOneWidget);

    // Verifica que haya un CircleAvatar en la pantalla
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}

class SendaNahui {
  const SendaNahui();
}
