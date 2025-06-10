import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_notifier.dart';
import '../providers/settings_notifier.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final settings = Provider.of<SettingsNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: themeNotifier.isDarkMode,
            onChanged: (value) => themeNotifier.toggleTheme(value),
            secondary: Icon(
                themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode),
          ),
          SwitchListTile(
            title: const Text('Sonidos'),
            value: settings.soundsEnabled,
            onChanged: (_) => settings.toggleSounds(),
            secondary: const Icon(Icons.volume_up),
          ),
          ListTile(
            title: const Text('Idioma'),
            subtitle: Text(settings.language == 'es' ? 'Español' : 'Inglés'),
            leading: const Icon(Icons.language),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Selecciona idioma'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: const Text('Español'),
                        value: 'es',
                        groupValue: settings.language,
                        onChanged: (val) {
                          settings.setLanguage(val as String);
                          Navigator.pop(context);
                        },
                      ),
                      RadioListTile(
                        title: const Text('Inglés'),
                        value: 'en',
                        groupValue: settings.language,
                        onChanged: (val) {
                          settings.setLanguage(val as String);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Tamaño del texto'),
            subtitle: Text('${(settings.fontScale * 100).toInt()}%'),
            leading: const Icon(Icons.format_size),
            trailing: SizedBox(
              width: 150,
              child: Slider(
                value: settings.fontScale,
                min: 0.8,
                max: 1.5,
                divisions: 7,
                label: '${(settings.fontScale * 100).toInt()}%',
                onChanged: (val) => settings.setFontScale(val),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Restablecer configuración'),
            leading: const Icon(Icons.restore),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('¿Restablecer configuración?'),
                  content:
                      const Text('Esto borrará tus preferencias guardadas.'),
                  actions: [
                    TextButton(
                      child: const Text('Cancelar'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    ElevatedButton(
                      child: const Text('Confirmar'),
                      onPressed: () {
                        settings.resetSettings();
                        // Solo si queremos resetear el tema también:
                        if (themeNotifier.isDarkMode) {
                          themeNotifier.toggleTheme(false);
                        }
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Configuración restablecida'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
