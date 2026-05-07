import 'dart:ui';

class CallLog {
  String initials;
  String name;
  String callTime;
  int callType; // 1=Incoming, 2=Outgoing, 3=Missed, 4=Rejected
  String callMode; // "V" = Voice, "A" = Audio
  Color bgColor; // Optional: for UI, like avatars

  CallLog({
    required this.initials,
    required this.name,
    required this.callTime,
    required this.callType,
    required this.callMode,
    required this.bgColor,
  }) : assert(callType >= 1 && callType <= 4, "callType must be 1-4"),
       assert(
         callMode == "V" || callMode == "A",
         'callMode must be "V" or "A"',
       );
}
