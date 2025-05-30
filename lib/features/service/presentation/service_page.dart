import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/input_search.dart';
import '../../../core/extensions/widget_extensions.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> services = [
      'Servicio 1',
      'Servicio 2',
      'Servicio 3',
      'Servicio 4',
      'Servicio 5',
      'Servicio 6',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Servicios',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Acción al presionar el botón de notificaciones
            },
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
              SizedBox(
                height: 210,
                child: PageView.builder(
                  itemCount: 3,
                  controller: PageController(
                    viewportFraction: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                              child: Image.asset(
                                'assets/images/${index + 1}.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            'Servicios',
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ).addSpacing(8),
                    );
                  },
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
                      context.push('/services/details');
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
