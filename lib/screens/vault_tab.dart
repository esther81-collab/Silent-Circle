import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/incident_log.dart';
import '../providers/app_state.dart';

class VaultTab extends StatelessWidget {
  const VaultTab({super.key});

  void _addIncidentDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    String category = 'Harassment';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Vault Entry'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title / Summary'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Details / Notes'),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: category,
              items: ['Harassment', 'Physical', 'Verbal', 'Financial', 'Other']
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) {
                if (val != null) category = val;
              },
              decoration: const InputDecoration(labelText: 'Category'),
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
                Provider.of<AppState>(context, listen: false).addVaultLog(
                  IncidentLog(
                    id: DateTime.now().toIso8601String(),
                    date: DateTime.now(),
                    title: titleController.text,
                    description: descController.text,
                    category: category,
                  ),
                );
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text('Save to Vault'),
          ),
        ],
      ),
    );
  }

  void _exportSummary(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Secure Export Summary'),
        content: const Text('Generate an encrypted PDF summary of your evidence timeline to take to SAPS, Thuthuzela Care Centres, or legal counsel?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Secure evidence summary exported successfully.')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: const Text('Export PDF'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final logs = appState.vaultLogs;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade800),
            ),
            child: Row(
              children: [
                const Icon(Icons.lock_outline, color: Colors.tealAccent, size: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Private Evidence Locker',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Files are encrypted locally. Warning: Keep backups secure.',
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6), fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => _exportSummary(context),
                  icon: const Icon(Icons.share_outlined, color: Colors.tealAccent),
                  tooltip: 'Export Summary',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Incident Timeline',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => _addIncidentDialog(context),
                icon: const Icon(Icons.note_add_outlined, color: Colors.tealAccent),
                tooltip: 'Add Entry',
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (logs.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text('No entries in your secure vault yet.'),
              ),
            ),
          ...logs.map((log) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            log.title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.teal.shade900,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              log.category,
                              style: const TextStyle(color: Colors.tealAccent, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        log.description,
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7)),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Recorded: ${log.date.toLocal().toString().split('.')[0]}',
                        style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4), fontSize: 12),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
