import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'circle_tab.dart';
import 'vault_tab.dart';
import 'safety_plan_tab.dart';
import 'bystander_tab.dart';
import 'resources_tab.dart';
import '../providers/app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    CircleTab(),
    VaultTab(),
    SafetyPlanTab(),
    BystanderTab(),
    ResourcesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    if (appState.isDisguised) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          actions: [
            IconButton(
              icon: const Icon(Icons.lock_open, color: Colors.tealAccent),
              onPressed: () => appState.toggleDisguise(),
              tooltip: 'Exit Disguise',
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(16),
                child: const Text('0', style: TextStyle(fontSize: 48)),
              ),
              const Divider(),
              for (var row in [['7', '8', '9', '/'], ['4', '5', '6', 'x'], ['1', '2', '3', '-'], ['C', '0', '=', '+']])
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: row.map((btn) => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                          ),
                          child: Text(btn, style: const TextStyle(fontSize: 20)),
                        )).toList(),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Silent Circle',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(appState.isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: () => appState.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.visibility_off_outlined, color: Colors.tealAccent),
            onPressed: () => appState.toggleDisguise(),
            tooltip: 'Quick Disguise Mode',
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.teal,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: 'Circle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_person_outlined),
            label: 'Vault',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Bystander',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_outlined),
            label: 'Resources',
          ),
        ],
      ),
    );
  }
}
