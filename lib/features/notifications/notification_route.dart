import 'package:go_router/go_router.dart';

import 'presentation/notifications_page.dart';

final notificationRoutes = [
  GoRoute(
    path: '/notifications',
    builder: (context, state) => const NotificationsPage(),
  ),
];
