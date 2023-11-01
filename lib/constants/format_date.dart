//DATE FORMAT
import 'package:intl/intl.dart';

String formatDate(String? inputDate) {
  try {
    DateTime date = DateTime.parse(inputDate.toString());
    String formattedDate = DateFormat("dd MMM yyyy").format(date);
    return formattedDate;
  } catch (e) {
    return "";
  }
}

String formatTime(String? inputTime) {
  try {
    final dateTime = DateFormat('hh:mm:ss').parse(inputTime.toString());
    final formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  } catch (e) {
    return "--";
  }
}
