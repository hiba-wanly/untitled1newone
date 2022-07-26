import 'package:dio/dio.dart';
// import 'package:untitled1newone/mytrip/MyTrip.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';
class CurrencyClient {
  static String BaseUrl = "http://free.currconv.com/api/v7/";

  Dio dio = Dio(BaseOptions(baseUrl: BaseUrl));

  Future<List<Country>> GetOptions() async {
    try {
      Response response =
      await dio.get("countries?apiKey=b287a08285fabb2d999a");
      print("currencies response :" + response.data.toString());
      Map<String, dynamic> list = response.data["results"];

      // List<CurrencyOption> Options =
      //     list.values.map((e) => CurrencyOption.fromJson(e)).toList();

      List<Country> Currencies = list.values
          .map(
              (e) => Country(e['currencyId'], e['id'].toString().toLowerCase()))
          .toList();
      //Options.map((e) => Country(e.currencyId, e.id)).toList();

      return Currencies;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
      } else {
        print("Error due to sending the request");
      }
      return [];
    }
  }

  Future<double> GetRate(String From, String To) async {
    try {
      Response response = await dio.get("convert?q=" +
          "${From}" +
          "_" +
          "${To}" +
          "&compact=ultra&apiKey=b287a08285fabb2d999a");
      print("rate response :" + response.data.toString());
      print(response.data['${From}_${To}'].toString());

      return response.data['${From}_${To}']+.0;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
      } else {
        print("Error due to sending the request");
      }
      return -1;
    }
  }
}
