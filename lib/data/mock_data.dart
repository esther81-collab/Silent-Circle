import '../models/circle_member.dart';
import '../models/support_resource.dart';

class MockData {
  static const List<SupportResource> saResources = [
    SupportResource(
      name: 'TEARS Foundation',
      description: 'Helpline providing confidential support and intervention for survivors of domestic violence and sexual assault.',
      phoneNumber: '*134*7355#',
      smsNumber: '081 160 3333',
    ),
    SupportResource(
      name: 'Thuthuzela Care Centre (TCC)',
      description: 'One-stop facilities integrated into public hospitals for victims of rape and sexual assault.',
      phoneNumber: '0800 428 428',
    ),
    SupportResource(
      name: 'SAPS GBV Command Centre',
      description: 'National police service gender-based violence hotline.',
      phoneNumber: '0800 150 150',
      smsNumber: '31531',
    ),
    SupportResource(
      name: 'LifeLine South Africa',
      description: 'Nationwide emotional support and counseling service.',
      phoneNumber: '0861 322 322',
    ),
  ];

  static List<CircleMember> initialCircle = [
    CircleMember(
      id: '1',
      name: 'Aisha Khumalo',
      phoneNumber: '082 555 1234',
      relationship: 'Sister',
      status: 'safe',
      lastCheckIn: DateTime.now().subtract(const Duration(minutes: 45)),
    ),
    CircleMember(
      id: '2',
      name: 'David van Wyk',
      phoneNumber: '073 555 5678',
      relationship: 'Neighbour',
      status: 'safe',
      lastCheckIn: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ];
}
