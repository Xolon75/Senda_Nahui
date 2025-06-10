import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F2), // Fondo suave
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo de Senda Nahui
              Image.asset(
                'assets/images/logo.png',
                height: 120,
              ),

              const SizedBox(height: 30),

              // Título de bienvenida
              const Text(
                'Bienvenida a Senda Nahui',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: 'DancingScript',
                  color: Color(0xFF5C6BC0), // Índigo suave
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Aquí comienza tu camino hacia la sanación.\nDa el primer paso...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 40),

              // Botón para avanzar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C6BC0),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()),
                  );
                },
                child: const Text(
                  'Iniciar con Naomi',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
