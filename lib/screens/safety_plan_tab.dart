import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/safety_plan.dart';
import '../providers/app_state.dart';

class SafetyPlanTab extends StatelessWidget {
  const SafetyPlanTab({super.key});

  void _addPlanItemDialog(BuildContext context) {
    final titleController = TextEditingController();
    final detailsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Safety Step'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Step Title'),
            ),
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(labelText: 'Details / Actions'),
              maxLines: 3,
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
              if (titleController.text.isNotEmpty) {
                Provider.of<AppState>(context, listen: false).addSafetyItem(
                  SafetyPlanItem(
                    id: DateTime.now().toIso8601String(),
                    title: titleController.text,
                    details: detailsController.text,
                  ),
                );
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text('Add to Plan'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final plan = appState.safetyPlan;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.shade900.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.teal.shade700),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.assignment_outlined, color: Colors.tealAccent, size: 28),
                    SizedBox(width: 12),
                    Text(
                      'Personal Safety Plan',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'A confidential preparation plan tailored to South African legal frameworks (Protection Orders, Shelters, Thuthuzela Care Centres).',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'My Safety Checklist',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => _addPlanItemDialog(context),
                icon: const Icon(Icons.add_circle_outline, color: Colors.tealAccent),
                tooltip: 'Add Custom Step',
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...plan.map((item) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: CheckboxListTile(
                  title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(item.details, style: const TextStyle(fontSize: 13)),
                  value: item.isCompleted,
                  activeColor: Colors.teal,
                  onChanged: (val) {
                    appState.toggleSafetyItem(item.id);
                  },
                ),
              )),
        ],
      ),
    );
  }
}
