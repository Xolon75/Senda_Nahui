import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_notifier.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    // Fix: Instead of accessing themeMode, use isDarkMode to determine the current theme
    final isDarkMode = themeNotifier.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // Use isDarkMode to conditionally style your UI if needed
        color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/images/profile_placeholder.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nombre de Usuario',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'usuario@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            // Profile information cards
            Card(
              child: ListTile(
                leading: const Icon(Icons.school),
                title: const Text('Nivel Educativo'),
                subtitle: const Text('Docente'),
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.history),
                title: const Text('Historial de Actividades'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to activity history
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Editar Perfil'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to edit profile
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
