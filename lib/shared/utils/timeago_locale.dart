import 'package:timeago/timeago.dart' as timeago;

class TimeagoLocale extends timeago.LookupMessages {
  @override String prefixAgo() => 'há';
  @override String prefixFromNow() => 'em';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'agora mesmo';
  @override String aboutAMinute(int minutes) => '1 minuto';
  @override String minutes(int minutes) => '$minutes minutos';
  @override String aboutAnHour(int minutes) => '1 hora';
  @override String hours(int hours) => '$hours horas';
  @override String aDay(int hours) => '1 dia';
  @override String days(int days) => '$days dias';
  @override String aboutAMonth(int days) => '1 mês';
  @override String months(int months) => '$months meses';
  @override String aboutAYear(int year) => '1 ano';
  @override String years(int years) => '$years anos';
  @override String wordSeparator() => ' ';
}

void setupTimeago() {
  timeago.setLocaleMessages('pt_BR', TimeagoLocale());
}
