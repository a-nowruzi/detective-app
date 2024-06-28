import 'dart:convert';

String convertNumberToEnglish(String num) {
  String d = num;
  d = d.replaceAll("۰", "0");
  d = d.replaceAll("۱", "1");
  d = d.replaceAll("۲", "2");
  d = d.replaceAll("٣", "3");
  d = d.replaceAll("٤", "4");
  d = d.replaceAll("۵", "5");
  d = d.replaceAll("٦", "6");
  d = d.replaceAll("٧", "7");
  d = d.replaceAll("۸", "8");
  d = d.replaceAll("۹", "9");
  d = d.replaceAll("۰", "0");
  d = d.replaceAll("۱", "1");
  d = d.replaceAll("۲", "2");
  d = d.replaceAll("۳", "3");
  d = d.replaceAll("۴", "4");
  d = d.replaceAll("۵", "5");
  d = d.replaceAll("۶", "6");
  d = d.replaceAll("۷", "7");
  d = d.replaceAll("۸", "8");
  d = d.replaceAll("۹", "9");
  d = d.replaceAll("0", "0");
  d = d.replaceAll("1", "1");
  d = d.replaceAll("2", "2");
  d = d.replaceAll("3", "3");
  d = d.replaceAll("4", "4");
  d = d.replaceAll("5", "5");
  d = d.replaceAll("6", "6");
  d = d.replaceAll("7", "7");
  d = d.replaceAll("8", "8");
  d = d.replaceAll("9", "9");
  return d;
}

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}

String persianMonth(int monthNumber) {
  List<String> names = [
    '',
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];
  return names[monthNumber];
}
