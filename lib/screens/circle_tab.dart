import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/circle_member.dart';
import '../providers/app_state.dart';

class CircleTab extends StatelessWidget {
  const CircleTab({super.key});

  void _addMemberDialog(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    String relation = 'Family';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Trusted Member (Max 6-8)'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: relation,
              items: ['Family', 'Friend', 'Neighbour', 'Colleague']
                  .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                  .toList(),
              onChanged: (val) {
                if (val != null) relation = val;
              },
              decoration: const InputDecoration(labelText: 'Relationship'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                Provider.of<AppState>(context, listen: false).addCircleMember(
                  CircleMember(
                    id: DateTime.now().toIso8601String(),
                    name: nameController.text,
                    phoneNumber: phoneController.text,
                    relationship: relation,
                    status: 'safe',
                    lastCheckIn: DateTime.now(),
                  ),
                );
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

  void _triggerCheckIn(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Silent check-in ping sent to your Silent Circle.'),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _triggerDistressAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Silent Distress Alert'),
        content: const Text('This will silently alert your trusted circle members immediately with your current status. Confirm?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('⚠️ Silent distress alert sent to all circle members.'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade800),
            child: const Text('Send Alert'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final members = appState.circleMembers;

    return Scaffold(
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Invite-only private network (${members.length}/8 members).',
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.75), fontSize: 14),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _triggerCheckIn(context),
                        icon: const Icon(Icons.check_circle_outline),
                        label: const Text('I’m Okay'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _triggerDistressAlert(context),
                        icon: const Icon(Icons.warning_amber_rounded),
                        label: const Text('Silent Alert'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade800,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Silent Circle Members',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => _addMemberDialog(context),
                icon: const Icon(Icons.person_add_outlined, color: Colors.tealAccent),
                tooltip: 'Add Member',
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...members.map((member) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal.shade800,
                    child: Text(member.name[0], style: const TextStyle(color: Colors.white)),
                  ),
                  title: Text(member.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${member.relationship} • ${member.phoneNumber}'),
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
