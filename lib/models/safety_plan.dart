class SafetyPlanItem {
  final String id;
  final String title;
  final String details;
  bool isCompleted;

  SafetyPlanItem({
    required this.id,
    required this.title,
    required this.details,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'details': details,
        'isCompleted': isCompleted,
      };

  factory SafetyPlanItem.fromJson(Map<String, dynamic> json) => SafetyPlanItem(
        id: json['id'],
        title: json['title'],
        details: json['details'],
        isCompleted: json['isCompleted'] ?? false,
      );
}
