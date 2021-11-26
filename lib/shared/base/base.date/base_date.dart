
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BaseDate{

  static  String dateConverter(String date) {
    // Input date Format
    final formatIn = DateFormat('yyyy-mm-dd');
    DateTime gettingDate = formatIn.parse(date);
    final DateFormat formatter = DateFormat('dd-mm-yyyy');
    // Output Date Format
    return formatter.format(gettingDate);
  }
}