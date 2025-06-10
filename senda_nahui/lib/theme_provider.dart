import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false;
  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: darkMode,
            onChanged: (value) {
              setState(() {
                darkMode = value;
                // Aquí puedes llamar a tu lógica para cambiar el tema global
              });
            },
          ),
          SwitchListTile(
            title: const Text('Sonidos'),
            value: soundEnabled,
            onChanged: (value) {
              setState(() {
                soundEnabled = value;
                // Aquí podrías guardar esta config localmente
              });
            },
          ),
          ListTile(
            title: const Text('Idioma'),
            subtitle: const Text('Español'),
            onTap: () {
              // Aquí podrías mostrar un diálogo o navegar a una pantalla para seleccionar idioma
            },
          ),
        ],
      ),
    );
  }
}
