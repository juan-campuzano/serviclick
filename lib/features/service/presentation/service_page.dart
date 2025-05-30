import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/input_search.dart';
import '../../../core/extensions/widget_extensions.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> services = [
      'Plomería',
      'Limpieza de hogar',
      'Jardinería',
      'Electricidad',
      'Manualidades',
      'Pintura',
    ];
    final featuredServices = [
      {
        'title': 'Diseño de interiores',
        'subtitle': 'Transforma tu hogar',
        'image': 'assets/images/1.png',
      },
      {
        'title': 'Limpieza de hogar',
        'subtitle': 'Deja tu hogar impecable',
        'image': 'assets/images/2.png',
      },
      {
        'title': 'Jardinería profesional',
        'subtitle': 'Crea espacios únicos',
        'image': 'assets/images/3.png',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Servicios',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InputSearch(),
              Text(
                'Destacados',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              GestureDetector(
                onTap: () {
                  context.push('/services/details');
                },
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: featuredServices.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final item = featuredServices[index];
                      return SizedBox(
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(item['image']!,
                                  height: 100, width: 160, fit: BoxFit.cover),
                            ),
                            const SizedBox(height: 4),
                            Text(item['title']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text(item['subtitle']!,
                                style: const TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push('/services/register');
                  },
                  child: const Text('Lista tus servicios'),
                ),
              ),
              Text(
                'Categorías populares',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push('/services/list');
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/categories/${index + 1}.png',
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          services[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ).addSpacing(16.0),
        ),
      ),
    );
  }
}
