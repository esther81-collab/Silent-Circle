# 🛡️ Silent Circle

**A discreet, trust-based safety network for South Africa**

> Private circles. Quiet support. Stronger together.

Silent Circle is a Flutter mobile app designed to help people in South Africa stay safer through trusted private networks, discreet alerts, guided support, and secure tools — without drawing unwanted attention.

---

## ✨ Why Silent Circle?

Most safety apps focus on loud panic buttons.  
Silent Circle focuses on **prevention, trust, and discretion**.

- Create small private circles of people you trust  
- Send silent alerts only to your circle  
- Build a personal safety plan  
- Store evidence privately and securely  
- Report incidents safely  
- Get guided bystander support  

Built with real South African contexts in mind.

---

##Key Features

###Silent Circles
Create small, invite-only groups (max 6–8 people) of trusted friends, family or neighbours.  
Private chat + shared safety tools.

###Discreet Alerts & Check-ins
- One-tap silent distress alert (with optional live location)
- Simple “I’m okay” check-ins
- Triggers that look normal to outsiders

###Bystander Support
Guided flows for when you suspect someone is in danger — with practical South African advice.

###Personal Safety Plan
Step-by-step private safety plan with local guidance (Protection Orders, shelters, important documents).

###Private Evidence Locker
Securely store photos, screenshots, documents and voice notes related to an abuser.  
Share only with selected circle members or export for official use.

###Safe Incident Reporting
Guided reporting with options for anonymity or limited sharing.  
Always encourages official channels (SAPS & GBV Command Centre).

###Strong Privacy
- Quick Exit / Disguise mode
- Optional PIN / biometric lock
- Minimal data collection

---

##Tech Stack

| Technology            | Purpose                          |
|-----------------------|----------------------------------|
| Flutter & Dart        | Cross-platform UI                |
| Firebase Auth         | Secure user authentication       |
| Cloud Firestore       | Real-time data & circles         |
| Firebase Storage      | Private evidence files           |
| Firebase Messaging    | Silent alerts & notifications    |
| Provider / Riverpod   | State management                 |

---

##Screens Overview

- Onboarding & Privacy introduction
- Home Dashboard
- My Circles
- Silent Alert
- Safety Plan Builder
- Evidence Locker
- Report Incident
- Resources & Helplines
- Settings & Disguise Mode

---

##Getting Started

###Prerequisites
- Flutter SDK (3.24+)
- Android Studio or VS Code
- Firebase project

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/silent_circle.git
cd silent_circle

Install dependencies

Bashflutter pub get

Add your Firebase configuration


Place google-services.json in android/app/
Place GoogleService-Info.plist in ios/Runner/ (if supporting iOS)


Run the app

Bashflutter run

Project Structure
textlib/
├── core/               # Constants, themes, utils
├── features/
│   ├── auth/
│   ├── circles/
│   ├── alerts/
│   ├── safety_plan/
│   ├── evidence/
│   ├── reporting/
│   └── resources/
├── shared/             # Common widgets & services
└── main.dart

 Important Safety Notice
Silent Circle is a support tool, not a replacement for emergency services.
In immediate danger, always contact:

SAPS: 10111
GBV Command Centre: 0800 428 428
National Shelter Helpline: 0800 001 005

Storing evidence on a phone carries risk. Use the app’s privacy features carefully.

🎥 Demo Video
A full demonstration video covering functionality, design decisions, code structure, and future improvements will be available here after submission.

👩‍💻 Developed By
Built as a final year / module project with care for real-world impact in South Africa.

📄 License
This project is for educational purposes.
