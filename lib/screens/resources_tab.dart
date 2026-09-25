import 'package:flutter/material.dart';
import '../data/mock_data.dart';

class ResourcesTab extends StatelessWidget {
  const ResourcesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Verified SA Support Services',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 4),
          const Text(
            'Confidential hotlines and care centers available across South Africa.',
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
          const SizedBox(height: 16),
          ...MockData.saResources.map((resource) => Card(
                color: Colors.grey.shade900,
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resource.name,
                        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        resource.description,
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.phone_outlined, color: Colors.tealAccent, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                resource.phoneNumber,
                                style: const TextStyle(color: Colors.tealAccent, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          if (resource.smsNumber.isNotEmpty)
                            Row(
                              children: [
                                const Icon(Icons.sms_outlined, color: Colors.white60, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  'SMS: ${resource.smsNumber}',
                                  style: const TextStyle(color: Colors.white60),
                                ),
                              ],
                            ),
                        ],
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
