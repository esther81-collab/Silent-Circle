import '../models/circle_member.dart';
import '../models/support_resource.dart';
import '../models/safety_plan.dart';
import '../models/bystander_guide.dart';

class MockData {
  static const List<SupportResource> saResources = [
    SupportResource(
      name: 'GBV Command Centre',
      description: 'National Department of Social Development 24/7 helpline dedicated to GBV support.',
      phoneNumber: '0800 428 428',
      smsNumber: '31531',
    ),
    SupportResource(
      name: 'TEARS Foundation',
      description: 'Confidential support and intervention for survivors of domestic violence and sexual assault.',
      phoneNumber: '*134*7355#',
      smsNumber: '081 160 3333',
    ),
    SupportResource(
      name: 'National Shelter Movement',
      description: 'Support and safe accommodation directory for women and children fleeing abuse.',
      phoneNumber: '0800 001 005',
    ),
    SupportResource(
      name: 'SAPS Emergency / GBV Desk',
      description: 'National Police emergency line for immediate physical danger.',
      phoneNumber: '10111',
    ),
    SupportResource(
      name: 'Thuthuzela Care Centre (TCC)',
      description: 'One-stop specialized facilities at public hospitals providing trauma counseling, medical examination, and legal support.',
      phoneNumber: '0800 428 428',
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

  static List<SafetyPlanItem> initialSafetyPlan = [
    SafetyPlanItem(
      id: '1',
      title: 'Identify Safe Places',
      details: 'Know where you can go if you need to leave quickly (e.g., trusted neighbor, police station, local clinic).',
      isCompleted: true,
    ),
    SafetyPlanItem(
      id: '2',
      title: 'Prepare an Emergency Bag',
      details: 'Keep ID documents, copies of protection orders, spare cash, house keys, and essential medications in a discreet, accessible bag.',
      isCompleted: false,
    ),
    SafetyPlanItem(
      id: '3',
      title: 'Establish a Code Word',
      details: 'Agree on a secret word or emoji with your Silent Circle members that immediately signals danger without calling attention.',
      isCompleted: false,
    ),
    SafetyPlanItem(
      id: '4',
      title: 'Protect Digital Privacy',
      details: 'Clear search history if needed, use biometric locks on sensitive apps, and avoid sharing live location publicly.',
      isCompleted: true,
    ),
  ];

  static const List<BystanderGuideItem> bystanderTips = [
    BystanderGuideItem(
      context: 'Home & Neighbourhood',
      scenario: 'You hear shouting, crashing, or distress from next door.',
      recommendedAction: 'Knock on the door politely to ask for sugar or check the time, creating an interruption without escalating aggression. Or call SAPS / GBVCC if physical violence is observed.',
      safetyWarning: 'Never put yourself in direct physical danger confronting an aggressive abuser.',
    ),
    BystanderGuideItem(
      context: 'Public Transport / Taxi',
      scenario: 'A passenger looks distressed or is being harassed inside a minibus taxi or train.',
      recommendedAction: 'Move closer, engage the person in neutral conversation, or ask the driver to stop in a well-lit public area.',
      safetyWarning: 'Assess the reactions of other passengers before intervening directly.',
    ),
    BystanderGuideItem(
      context: 'Campus & Student Residence',
      scenario: 'A peer discloses controlling behavior or abuse by a partner.',
      recommendedAction: 'Listen without judgment, believe them, and help them connect with campus counseling or Silent Circle resources.',
      safetyWarning: 'Maintain strict confidentiality unless someone’s life is in immediate danger.',
    ),
    BystanderGuideItem(
      context: 'Workplace',
      scenario: 'A colleague receives threatening messages or appears fearful at work.',
      recommendedAction: 'Offer a safe space to talk, document dates/times if asked, and consult HR or campus safety.',
      safetyWarning: 'Respect the survivor’s autonomy on when and how to report.',
    ),
  ];
}
