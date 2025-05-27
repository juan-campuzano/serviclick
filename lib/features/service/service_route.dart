import 'package:go_router/go_router.dart';
import 'package:serviclick/features/service/presentation/service_details_page.dart';

import 'presentation/service_page.dart';

final servicesRoutes = [
  GoRoute(
    path: '/services',
    builder: (context, state) => const ServicePage(),
  ),
  GoRoute(
    path: '/services/details',
    builder: (context, state) => const ServiceDetailsPage(),
  ),
];
