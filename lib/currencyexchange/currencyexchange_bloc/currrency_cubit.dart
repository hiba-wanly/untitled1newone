import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:safari/CurrencyExchange/BusinessLogic(Bloc)/Currency_States.dart';
// import 'package:safari/CurrencyExchange/CurrencyExchange(API).dart';
// import 'package:safari/mytrip/MyTrip.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_bloc/currency_states.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_api.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';
class CurrencyCubit extends Cubit<CurrencyStates> {
  CurrencyCubit(CurrencyStates initialState) : super(initialState);

  List<Country> Currencies = [];
  double Rate = 0.0;

  CurrencyClient currencyClient = CurrencyClient();

  getCurrencies() async {
    print("inside cubit");
    this.Currencies = await currencyClient.GetOptions();
    emit(CurrenciesLoaded(this.Currencies));
  }

  getRate(String From, String To) async {
    print("getRate Activated");
    emit(WaitingResponse());
    this.Rate = await currencyClient.GetRate(From, To);
    emit(RateLoaded(this.Rate));
  }
}
