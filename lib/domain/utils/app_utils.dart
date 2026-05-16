import 'package:intl/intl.dart';

class AppUtils {
  AppUtils._();

  static String getInitials(String name) {
    String initials = "";
    name.split(" ").forEach((e) {
      initials += e[0];
    });
    if (initials.length >= 2) {
      return initials.substring(0, 2);
    }
    return initials;
  }

  static String getMessageTime(int timeInMillis) {
    return DateFormat(
      "HH:mm",
    ).format(DateTime.fromMillisecondsSinceEpoch(timeInMillis));
  }
}
