import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/bottom_nav_bar.dart';

class AppShell extends StatefulWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final tabs = ['/services', '/notifications', '/profile'];

  void _onTap(int index) {
    setState(() => _currentIndex = index);
    context.go(tabs[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
