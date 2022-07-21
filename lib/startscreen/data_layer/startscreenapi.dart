import 'package:dio/dio.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';

class StartApi {
  static String BaseUrl = "http://192.168.43.59:8000/api/";

  Dio dio = Dio(BaseOptions(baseUrl: BaseUrl));

  Future<List<dynamic>> GetImages(String type)  async {
    try {
      print("inside GetImages");
      Response response = await dio.get('getPlaces/'+type);
      print(response.data);

      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response);
      } else {
        print("error due to sending the request");
      }
      return [];
    }
  }

   Future<List<AddPlacesModel>> GetPlaces(String City) async
  {
    try
    {
      Response response = await  dio.get('GetLandmarks/'+City);
      print(response.data.toString());
      // return  /response.data;
      print("hehe");
      List<dynamic> Placess = response.data;
      List<AddPlacesModel> LandM = Placess.map((e) => AddPlacesModel.fromJson(e)).toList();
      return LandM;
      // return response.data.map((e) => AddPlacesModel.fromJson(e)).toList();
      
  }
  on DioError catch(e)
    {
      if(e.response!=null)
      {
        print(e.response);
        print("here again");
      }

      else
        {
          print("error due to sending the request");
        }
        return [];
    }
  }


 
}
