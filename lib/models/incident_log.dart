class IncidentLog {
  final String id;
  final DateTime date;
  final String title;
  final String description;
  final String category; // e.g., "Verbal", "Physical", "Harassment", "Other"
  final List<String> attachmentPaths;

  IncidentLog({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.category,
    this.attachmentPaths = const [],
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'title': title,
        'description': description,
        'category': category,
        'attachmentPaths': attachmentPaths,
      };

  factory IncidentLog.fromJson(Map<String, dynamic> json) => IncidentLog(
        id: json['id'],
        date: DateTime.parse(json['date']),
        title: json['title'],
        description: json['description'],
        category: json['category'],
        attachmentPaths: List<String>.from(json['attachmentPaths'] ?? []),
      );
}
