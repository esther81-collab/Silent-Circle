class CircleMember {
  final String id;
  final String name;
  final String phoneNumber;
  final String relationship; // e.g., "Family", "Friend", "Neighbour"
  final String status; // "safe", "pending", "alert"
  final DateTime? lastCheckIn;

  CircleMember({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.relationship,
    this.status = 'safe',
    this.lastCheckIn,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phoneNumber': phoneNumber,
        'relationship': relationship,
        'status': status,
        'lastCheckIn': lastCheckIn?.toIso8601String(),
      };

  factory CircleMember.fromJson(Map<String, dynamic> json) => CircleMember(
        id: json['id'],
        name: json['name'],
        phoneNumber: json['phoneNumber'],
        relationship: json['relationship'],
        status: json['status'] ?? 'safe',
        lastCheckIn: json['lastCheckIn'] != null
            ? DateTime.parse(json['lastCheckIn'])
            : null,
      );
}
