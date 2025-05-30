import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text(
            'Hoy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          _NotificationItem(
            icon: Icons.calendar_today_outlined,
            title: 'Próximo Servicio',
            message:
                'Tu servicio de plomería está programado para mañana a las 10:00 AM.',
          ),
          _NotificationItem(
            icon: Icons.check,
            title: 'Reserva actualizada',
            message:
                'Tu reserva para el servicio de limpieza ha sido confirmada.',
          ),
          _NotificationItem(
            icon: Icons.percent,
            title: 'Oferta Especial',
            message:
                '¡Obtén un 20% de descuento en tu próximo servicio de jardinería!',
          ),
          SizedBox(height: 24),
          Text(
            'Ayer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          _NotificationItem(
            icon: Icons.message_outlined,
            title: 'Nuevo mensaje',
            message: 'Tienes un nuevo mensaje de tu proveedor de servicios.',
          ),
          _NotificationItem(
            icon: Icons.check,
            title: 'Servicio completado',
            message: 'Tu servicio de limpieza ha sido completado con éxito.',
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;

  const _NotificationItem({
    required this.icon,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F1F3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 4),
                Text(message,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
