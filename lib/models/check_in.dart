class CheckIn {
  final String id;
  final String title;
  final DateTime targetTime;
  final bool isActive;
  final bool isAcknowledged;

  CheckIn({
    required this.id,
    required this.title,
    required this.targetTime,
    this.isActive = true,
    this.isAcknowledged = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'targetTime': targetTime.toIso8601String(),
        'isActive': isActive,
        'isAcknowledged': isAcknowledged,
      };

  factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
        id: json['id'],
        title: json['title'],
        targetTime: DateTime.parse(json['targetTime']),
        isActive: json['isActive'] ?? true,
        isAcknowledged: json['isAcknowledged'] ?? false,
      );
}
