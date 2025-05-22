import 'package:go_router/go_router.dart';
import 'presentation/login_page.dart';

final loginRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
];
