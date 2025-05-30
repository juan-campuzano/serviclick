import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serviclick/core/extensions/widget_extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bienvenido/a',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/serviclick.png',
              height: 200,
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.go('/services');
                  },
                  child: const Text('Iniciar sesión'),
                ),
              ],
            ).addSpacing(20),
          ],
        ),
      ),
    );
  }
}
