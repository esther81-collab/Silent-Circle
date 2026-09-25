import 'package:flutter/material.dart';
import 'circle_tab.dart';
import 'vault_tab.dart';
import 'safety_plan_tab.dart';
import 'bystander_tab.dart';
import 'resources_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isDisguised = false;

  final List<Widget> _tabs = const [
    CircleTab(),
    VaultTab(),
    SafetyPlanTab(),
    BystanderTab(),
    ResourcesTab(),
  ];

  void _toggleDisguise() {
    setState(() {
      _isDisguised = !_isDisguised;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isDisguised ? 'Disguise Mode Active (Calculator View)' : 'Standard Silent Circle View'),
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isDisguised) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Text('Calculator', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: const Icon(Icons.lock_open, color: Colors.tealAccent),
              onPressed: _toggleDisguise,
              tooltip: 'Exit Disguise',
            ),
          ],
        ),
        body: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(16),
                child: const Text('0', style: TextStyle(fontSize: 48, color: Colors.white)),
              ),
              const Divider(color: Colors.grey),
              for (var row in [['7', '8', '9', '/'], ['4', '5', '6', 'x'], ['1', '2', '3', '-'], ['C', '0', '=', '+']])
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: row.map((btn) => ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade800,
                            padding: const EdgeInsets.all(20),
                          ),
                          child: Text(btn, style: const TextStyle(fontSize: 20, color: Colors.white)),
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
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Silent Circle',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility_off_outlined, color: Colors.tealAccent),
            onPressed: _toggleDisguise,
            tooltip: 'Quick Disguise Mode',
          ),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white60,
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
