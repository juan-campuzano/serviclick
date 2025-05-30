import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Servicio de plomería',
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/categories/1.png',
              height: 250,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Obtén el mejor servicio de plomería de la ciudad. Nuestros expertos están listos para ayudarte con cualquier problema de fontanería que tengas.',
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to booking page
              context.push('/services/details/book');
            },
            child: const Text('Reserva ahora'),
          ),

          const SectionTitle('Acerca del proveedor'),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              child: Text('S'),
            ),
            title: Text('Eugenio Martínez'),
            subtitle: Text('5 años de experiencia'),
          ),

          const SectionTitle('Precio'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.attach_money),
            ),
            title: const Text('Rango de precios'),
            subtitle: const Text('Comenzando desde \$150.000'),
          ),

          const SectionTitle('Reseñas'),
          const Text(
            '4.8',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const Text('125 reseñas'),
          const SizedBox(height: 12),

          // Rating Bars (mocked)
          ratingBar(5, 0.7),
          ratingBar(4, 0.2),
          ratingBar(3, 0.05),
          ratingBar(2, 0.03),
          ratingBar(1, 0.02),
          const SizedBox(height: 24),

          // Review 1
          reviewTile(
            name: 'Penelope Sophia',
            timeAgo: 'Hace 2 semanas',
            rating: 5,
            comment:
                'El servicio fue excelente, el plomero llegó a tiempo y resolvió el problema rápidamente. Muy recomendable.',
            likes: 15,
            replies: 2,
          ),

          // Review 2
          reviewTile(
            name: 'Daniella Arteaga',
            timeAgo: 'Hace un mes',
            rating: 4,
            comment:
                'Buen servicio, aunque el precio fue un poco alto. El plomero fue muy profesional y resolvió el problema.',
            likes: 8,
            replies: 1,
          ),
        ],
      ),
    );
  }

  Widget ratingBar(int stars, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$stars'),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          ),
          const SizedBox(width: 8),
          Text('${(percent * 100).round()}%'),
        ],
      ),
    );
  }

  Widget reviewTile({
    required String name,
    required String timeAgo,
    required int rating,
    required String comment,
    required int likes,
    required int replies,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              child: Text('J'),
            ),
            title: Text(name),
            subtitle: Text(timeAgo),
          ),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(comment),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.thumb_up_alt_outlined,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$likes'),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline,
                  size: 18, color: Colors.grey),
              const SizedBox(width: 4),
              Text('$replies'),
            ],
          )
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
