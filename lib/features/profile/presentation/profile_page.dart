import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F9),
      appBar: AppBar(
        title: const Text('Tu cuenta'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                child: Text('J'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Juan Campuzano',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              const Text(
                'Se unió en 2021',
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                '4.9 • 12 reseña',
                style: TextStyle(color: Colors.blueGrey),
              ),
              const SizedBox(height: 32),

              // Sección de "Manage"
              sectionTitle('Administrar'),
              profileItem(Icons.person_outline, 'Información personal'),
              profileItem(Icons.credit_card, 'Métodos de pago'),
              profileItem(Icons.notifications_none, 'Notificaciones'),
              profileItem(Icons.shield_outlined, 'Seguridad'),

              const SizedBox(height: 24),

              sectionTitle('Soporte'),
              profileItem(Icons.help_outline, 'Centro de ayuda'),
              profileItem(Icons.chat_bubble_outline, 'Contáctanos'),
              profileItem(Icons.description_outlined, 'Términos de servicio'),
              profileItem(Icons.logout, 'Cerrar sesión'),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget profileItem(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title),
      onTap: () {}, // Aquí puedes manejar navegación
    );
  }
}
