class SupportResource {
  final String name;
  final String description;
  final String phoneNumber;
  final String smsNumber;
  final String operatingHours;

  const SupportResource({
    required this.name,
    required this.description,
    required this.phoneNumber,
    this.smsNumber = '',
    this.operatingHours = '24/7',
  });
}
