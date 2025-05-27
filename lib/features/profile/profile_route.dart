import 'package:go_router/go_router.dart';
import 'presentation/profile_page.dart';

final profileRoute = [
  GoRoute(
    path: '/profile',
    builder: (context, state) => const ProfilePage(),
  ),
];
