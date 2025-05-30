import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingConfirmedPage extends StatelessWidget {
  const BookingConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio confirmado'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),

            // Título
            const Text(
              'Tu servicio ha sido agendado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 12),

            // Subtítulo
            const Text(
              "Has agendado con éxito tu servicio de limpieza. A continuación, encontrarás los detalles de tu reserva.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),

            const SizedBox(height: 32),

            // Información de la reserva
            const _InfoRow(
              icon: Icons.home_outlined,
              title: 'Servicio',
              subtitle: 'Servicio de limpieza',
            ),
            const _InfoRow(
              icon: Icons.calendar_today_outlined,
              title: 'Fecha y hora',
              subtitle: 'Julio 20, 2025, 2:00 PM',
            ),
            const _InfoRow(
              avatarImage:
                  'assets/images/1.png', // Reemplazar con tu imagen local o de red
              title: 'Proveedor',
              subtitle: 'Pepito Perez',
              isAvatar: true,
            ),
            const _InfoRow(
              icon: Icons.attach_money,
              title: 'Total a pagar',
              subtitle: '\$120000',
            ),

            const Spacer(),

            // Botón Ver Detalles
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              child: const Text(
                'Ver detalles de la reserva',
              ),
            ),

            const SizedBox(height: 12),

            OutlinedButton(
              onPressed: () {
                context.go('/services');
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFFF5F6F7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              child: const Text(
                'Volver al inicio',
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Widget reutilizable para mostrar ítems de información
class _InfoRow extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final String? avatarImage;
  final bool isAvatar;

  const _InfoRow({
    required this.title,
    required this.subtitle,
    this.icon,
    this.avatarImage,
    this.isAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          isAvatar
              ? CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(avatarImage ?? ''),
                )
              : Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F1F3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 24),
                ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
