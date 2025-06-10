import 'package:flutter/material.dart';

class AyudaScreen extends StatelessWidget {
  const AyudaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Centro de Ayuda')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '¿Necesitas apoyo?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Este espacio está diseñado para guiarte y resolver cualquier duda. '
              'Contamos con tutoriales, preguntas frecuentes y contacto directo con el equipo.',
            ),
            SizedBox(height: 40),
            Text('📚 Tutoriales • ❓ FAQ • 📩 Contacto directo'),
          ],
        ),
      ),
    );
  }
}
