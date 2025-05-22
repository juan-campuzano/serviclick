import 'package:go_router/go_router.dart';
import 'package:serviclick/features/home/home_route.dart';
import 'package:serviclick/features/login/login_route.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ...loginRoutes,
    ...homeRoutes,
  ],
);
