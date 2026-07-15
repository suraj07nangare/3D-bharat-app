import 'package:flutter/material.dart';
import '../core/widgets/app_bottom_navigation.dart';
import 'admirers/admirers_screen.dart';
import 'chat/chat_screen.dart';
import 'date_now/date_now_screen.dart';
import 'events/events_screen.dart';
import 'home/home_screen.dart';

/// Root shell that hosts the bottom navigation bar
/// and switches between the 5 main tabs.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    DateNowScreen(),
    AdmirersScreen(),
    ChatScreen(),
    EventsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
