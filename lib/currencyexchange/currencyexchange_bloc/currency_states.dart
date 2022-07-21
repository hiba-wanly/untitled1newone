import 'package:untitled1newone/mytrip/MyTrip.dart';

abstract class CurrencyStates {}

class CurrencyInitialState extends CurrencyStates{}

class CurrenciesLoaded extends CurrencyStates {

  final List<Country> Currencies;

  CurrenciesLoaded(this.Currencies);
}

class WaitingResponse extends CurrencyStates{}


class RateLoaded extends CurrencyStates{
  final double Rate;

  RateLoaded(this.Rate);
}
