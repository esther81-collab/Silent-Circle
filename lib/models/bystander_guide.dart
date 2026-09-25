class BystanderGuideItem {
  final String context; // e.g. "Home & Neighbourhood", "Public Transport / Taxi", "Campus & Res", "Workplace"
  final String scenario;
  final String recommendedAction;
  final String safetyWarning;

  const BystanderGuideItem({
    required this.context,
    required this.scenario,
    required this.recommendedAction,
    required this.safetyWarning,
  });
}
