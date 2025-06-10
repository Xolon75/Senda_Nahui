import 'package:flutter/material.dart';

class DocenteMainScreen extends StatelessWidget {
  const DocenteMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'icon': Icons.self_improvement,
        'title': 'Área Emocional',
        'desc':
            'Encuéntrate contigo mismo: meditaciones, consejos y espacio para liberar lo que cargas.',
      },
      {
        'icon': Icons.lightbulb_outline,
        'title': 'Estrategias de Enseñanza',
        'desc':
            'ABP, VARK, Aprendizaje Situado y más, explicado con ejemplos claros.',
      },
      {
        'icon': Icons.videogame_asset,
        'title': 'Gamificación y Motivación',
        'desc': 'Convierte el aula en una aventura divertida y significativa.',
      },
      {
        'icon': Icons.bookmark_border,
        'title': 'Mis Recursos',
        'desc':
            'Guarda ideas, lecturas y herramientas útiles para consultarlas después.',
      },
      {
        'icon': Icons.emoji_flags,
        'title': 'Mi Ruta',
        'desc': 'Ve tu camino de crecimiento y celebra tus avances.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explora tu camino'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading:
                  Icon(section['icon'] as IconData, color: Colors.deepPurple),
              title: Text(section['title'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(section['desc'] as String),
              onTap: () {
                // Navegación a la pantalla correspondiente
              },
            ),
          );
        },
      ),
    );
  }
}
