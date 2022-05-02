import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateVO {
  final String value;

  DateVO(this.value);

  static DateVO getToday() {
    initializeDateFormatting('ja');

    return DateVO(DateFormat('yyyy/MM/dd').format(DateTime.now()).toString());
  }

  static DateVO fromDateTime(DateTime dateTime) {
    initializeDateFormatting('ja');

    return DateVO(DateFormat('yyyy/MM/dd').format(dateTime).toString());
  }

  static DateVO calendarTitleFromDateTime(DateTime dateTime) {
    initializeDateFormatting('ja');

    return DateVO(DateFormat('yyyy/MM').format(dateTime).toString());
  }
}

extension DateVoExt on DateVO {
  bool isBefore(DateVO? dateVO) {
    if (dateVO == null) {
      return true;
    }
    final beforeDate = DateTime.parse(dateVO.value.replaceAll("/", "-"));
    return beforeDate.isBefore(DateTime.parse(value.replaceAll("/", "-")));
  }
}
