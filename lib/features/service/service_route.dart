import 'package:go_router/go_router.dart';
import 'presentation/booking_confirmed_page.dart';
import 'presentation/service_list_page.dart';
import 'presentation/service_registration_page.dart';
import 'presentation/scheduler_page.dart';
import 'presentation/service_details_page.dart';

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
  GoRoute(
    path: '/services/details/book',
    builder: (context, state) => const SchedulePage(),
  ),
  GoRoute(
    path: '/services/register',
    builder: (context, state) => const ServiceRegistrationPage(),
  ),
  GoRoute(
    path: '/services/list',
    builder: (context, state) => ServiceListPage(),
  ),
  GoRoute(
    path: '/services/booking-confirmed',
    builder: (context, state) => const BookingConfirmedPage(),
  ),
];
