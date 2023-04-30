import 'package:intl/intl.dart';

class TextHelper{


  static String formatDate(DateTime date){
    final DateFormat formatter = DateFormat('yMMMd');
    String returnString = formatter.format(date);
    return returnString;
  }

}