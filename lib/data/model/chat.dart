import 'dart:ui';

class Chat {
  String initials;
  String name;
  String time;
  int messageType;
  String message;
  bool isSent;
  bool isRead;
  int unreadCnt;
  bool isTimerOn;
  Color bgColor;

  Chat({
    required this.initials,
    required this.name,
    required this.time,
    required this.messageType,
    required this.message,
    required this.isSent,
    required this.isRead,
    required this.unreadCnt,
    required this.isTimerOn,
    required this.bgColor,
  });
}
