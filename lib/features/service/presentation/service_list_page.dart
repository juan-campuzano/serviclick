import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../domain/models/service.dart';

class ServiceListPage extends StatelessWidget {
  final List<Service> services = [
    Service(
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDvegkrr5oz88zI3OcUXaiv9K82wp7HFZRG8J0lQ7TAJ_0oSEpVJ0ht_u6G4n8x1Lqy6Zhdv8ItXIctHKuvXB7bx8OccNeM7vx4IQHnZ0fUAyDFKmRCQU61Wve6qyfXt3zAYc9uAWQx8CavENEVlWExnVZJBSLtsbuwCtlCCDdUFI5FjwU0-Nx8N-nOE8bGojXyJvsTagy1JVtbWfmK4_Dhcu1-g7i94CE30_SaIUppQ1EtUcT0ARyS_VIZxLNbMZUs7Wx1fyzaKl8',
      title: 'Limpieza estándar por Sandra',
      description: 'Limpieza básica para hogares pequeños',
      price: 60000,
      rating: 4.8,
      reviews: 120,
    ),
    Service(
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCx_gjMH6xej7hsEm1zpXKyu61AKG30iVM_33LDsW1WpNmuHTDHpY3kSZiJlGvqOSlMOa7IKqkinvL-fg6Dn-OeX0V8_2HqDrknprmwldv3SqctRCDznMtwlfzrZWHhhRkHu-S0wV0v7xr3MXCB-frUFHD8_HTcThMsJwF7zA0jvJLvuHQYyD9sYWM5YZSiSG7HdEwa-0W6lVfNe9bJMVF9QYYOxk3LFlIS09j104IdMZgKjsmR8Gr1KKv4hoT1WPtzC4s7mQOPnPU',
      title: 'Limpieza profunda por Jhon',
      description: 'Limpieza a fondo para hogares grandes, incluye ventanas',
      price: 120000,
      rating: 4.9,
      reviews: 150,
    ),
    Service(
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCx_gjMH6xej7hsEm1zpXKyu61AKG30iVM_33LDsW1WpNmuHTDHpY3kSZiJlGvqOSlMOa7IKqkinvL-fg6Dn-OeX0V8_2HqDrknprmwldv3SqctRCDznMtwlfzrZWHhhRkHu-S0wV0v7xr3MXCB-frUFHD8_HTcThMsJwF7zA0jvJLvuHQYyD9sYWM5YZSiSG7HdEwa-0W6lVfNe9bJMVF9QYYOxk3LFlIS09j104IdMZgKjsmR8Gr1KKv4hoT1WPtzC4s7mQOPnPU',
      title: 'Limpieza profunda por Jhon',
      description: 'Limpieza a fondo para hogares grandes, incluye ventanas',
      price: 120000,
      rating: 4.9,
      reviews: 150,
    ),
    Service(
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCx_gjMH6xej7hsEm1zpXKyu61AKG30iVM_33LDsW1WpNmuHTDHpY3kSZiJlGvqOSlMOa7IKqkinvL-fg6Dn-OeX0V8_2HqDrknprmwldv3SqctRCDznMtwlfzrZWHhhRkHu-S0wV0v7xr3MXCB-frUFHD8_HTcThMsJwF7zA0jvJLvuHQYyD9sYWM5YZSiSG7HdEwa-0W6lVfNe9bJMVF9QYYOxk3LFlIS09j104IdMZgKjsmR8Gr1KKv4hoT1WPtzC4s7mQOPnPU',
      title: 'Limpieza profunda por Jhon',
      description: 'Limpieza a fondo para hogares grandes, incluye ventanas',
      price: 120000,
      rating: 4.9,
      reviews: 150,
    ),
    // Agrega más servicios si lo deseas
  ];

  ServiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limpieza de hogar'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceCard(service: service);
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/services/details');
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                service.imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${service.rating} (${service.reviews})',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    service.description,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBDD5E7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('\$${service.price.toStringAsFixed(0)}'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
