import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/safety_plan.dart';

class SafetyPlanTab extends StatefulWidget {
  const SafetyPlanTab({super.key});

  @override
  State<SafetyPlanTab> createState() => _SafetyPlanTabState();
}

class _SafetyPlanTabState extends State<SafetyPlanTab> {
  final List<SafetyPlanItem> _plan = MockData.initialSafetyPlan;

  void _addPlanItemDialog() {
    final titleController = TextEditingController();
    final detailsController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Add Safety Step', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Step Title', labelStyle: TextStyle(color: Colors.white70)),
            ),
            TextField(
              controller: detailsController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Details / Actions', labelStyle: TextStyle(color: Colors.white70)),
              maxLines: 3,
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
              if (titleController.text.isNotEmpty) {
                setState(() {
                  _plan.add(
                    SafetyPlanItem(
                      id: DateTime.now().toIso8601String(),
                      title: titleController.text,
                      details: detailsController.text,
                    ),
                  );
                });
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
    return Scaffold(
      backgroundColor: Colors.black,
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
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'A confidential, step-by-step preparation plan tailored to South African legal frameworks (Protection Orders, Shelters, and Thuthuzela Care Centres). Share only with trusted circle members.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              IconButton(
                onPressed: _addPlanItemDialog,
                icon: const Icon(Icons.add_circle_outline, color: Colors.tealAccent),
                tooltip: 'Add Custom Step',
              ),
            ],
          ),
          const SizedBox(height: 8),
          ..._plan.map((item) => Card(
                color: Colors.grey.shade900,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: CheckboxListTile(
                  title: Text(item.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  subtitle: Text(item.details, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                  value: item.isCompleted,
                  activeColor: Colors.teal,
                  checkColor: Colors.white,
                  onChanged: (val) {
                    setState(() {
                      item.isCompleted = val ?? false;
                    });
                  },
                ),
              )),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SA Legal & Protection Order Guidance',
                  style: TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '• Protection Orders can be applied for at your nearest Magistrate’s Court at no cost.\n• You do not need a lawyer to apply for an interim protection order.\n• Emergency housing is available via the National Shelter Movement (0800 001 005).',
                  style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
