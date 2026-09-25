import 'package:flutter/foundation.dart';
import '../models/circle_member.dart';
import '../models/safety_plan.dart';
import '../models/incident_log.dart';
import '../data/mock_data.dart';

class AppState extends ChangeNotifier {
  bool _isDisguised = false;
  bool _isDarkMode = true;
  
  final List<CircleMember> _circleMembers = List.from(MockData.initialCircle);
  final List<SafetyPlanItem> _safetyPlan = List.from(MockData.initialSafetyPlan);
  final List<IncidentLog> _vaultLogs = [
    IncidentLog(
      id: '1',
      date: DateTime.now().subtract(const Duration(days: 2)),
      title: 'Verbal Threat at Home',
      description: 'Intense argument resulting in threats to property. Documented for record.',
      category: 'Harassment',
    ),
  ];

  bool get isDisguised => _isDisguised;
  bool get isDarkMode => _isDarkMode;
  List<CircleMember> get circleMembers => _circleMembers;
  List<SafetyPlanItem> get safetyPlan => _safetyPlan;
  List<IncidentLog> get vaultLogs => _vaultLogs;

  void toggleDisguise() {
    _isDisguised = !_isDisguised;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void addCircleMember(CircleMember member) {
    _circleMembers.add(member);
    notifyListeners();
  }

  void addSafetyItem(SafetyPlanItem item) {
    _safetyPlan.add(item);
    notifyListeners();
  }

  void toggleSafetyItem(String id) {
    final item = _safetyPlan.firstWhere((i) => i.id == id);
    item.isCompleted = !item.isCompleted;
    notifyListeners();
  }

  void addVaultLog(IncidentLog log) {
    _vaultLogs.insert(0, log);
    notifyListeners();
  }
}
