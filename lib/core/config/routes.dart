import 'package:go_router/go_router.dart';
import 'package:serviclick/features/notifications/notification_route.dart';
import 'package:serviclick/features/profile/profile_route.dart';
import 'package:serviclick/features/service/service_route.dart';
import 'package:serviclick/features/login/login_route.dart';

import '../../ui/app_shell.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ...loginRoutes,
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(child: child);
      },
      routes: [
        ...servicesRoutes,
        ...profileRoute,
        ...notificationRoutes,
      ],
    )
  ],
);
