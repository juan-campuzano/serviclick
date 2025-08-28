import 'package:go_router/go_router.dart';
import 'presentation/view/login_page.dart';

final loginRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const LoginPage(),
  ),
];
