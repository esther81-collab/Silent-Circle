import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/circle_member.dart';

class CircleTab extends StatefulWidget {
  const CircleTab({super.key});

  @override
  State<CircleTab> createState() => _CircleTabState();
}

class _CircleTabState extends State<CircleTab> {
  final List<CircleMember> _members = MockData.initialCircle;

  void _addMemberDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    String relation = 'Family';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Add Trusted Member', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
            TextField(
              controller: phoneController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Colors.white70),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: relation,
              dropdownColor: Colors.grey.shade900,
              style: const TextStyle(color: Colors.white),
              items: ['Family', 'Friend', 'Neighbour', 'Colleague']
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (val) {
                if (val != null) relation = val;
              },
              decoration: const InputDecoration(
                labelText: 'Relationship',
                labelStyle: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                setState(() {
                  _members.add(
                    CircleMember(
                      id: DateTime.now().toIso8601String(),
                      name: nameController.text,
                      phoneNumber: phoneController.text,
                      relationship: relation,
                      status: 'safe',
                      lastCheckIn: DateTime.now(),
                    ),
                  );
                });
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text('Add to Circle'),
          ),
        ],
      ),
    );
  }

  void _triggerCheckIn() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Safety check-in sent to your Silent Circle.'),
        backgroundColor: Colors.teal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal.shade900.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.teal.shade700, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.shield_outlined, color: Colors.tealAccent, size: 28),
                    SizedBox(width: 12),
                    Text(
                      'Circle Status: Protected',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Your trusted network is active. Tap below to send a silent check-in ping to all members.',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 14),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _triggerCheckIn,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Send Safe Check-In Ping'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Trusted Circle',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              IconButton(
                onPressed: _addMemberDialog,
                icon: const Icon(Icons.person_add_outlined, color: Colors.tealAccent),
                tooltip: 'Add Member',
              ),
            ],
          ),
          const SizedBox(height: 8),
          ..._members.map((member) => Card(
                color: Colors.grey.shade900,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade800,
                    child: Text(member.name[0], style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(member.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text('${member.relationship} • ${member.phoneNumber}', style: const TextStyle(color: Colors.white60)),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: member.status == 'safe' ? Colors.green.shade900 : Colors.orange.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      member.status.toUpperCase(),
                      style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
