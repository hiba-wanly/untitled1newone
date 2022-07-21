import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';

class PlacesApi {

  static String BaseUrl = "http://192.168.43.59:8000/api/";
  Dio dio = new Dio(BaseOptions(baseUrl: BaseUrl));
  
  Future<List<dynamic>> GetPlaces(String City) async
  {
    try
    {
      Response response = await  dio.get('GetLandmarks/'+City);
      print(response.data.toString());
      return response.data;
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

    Future<AddPlacesModel> GetOnePlace(String City,int id) async
  {
    try
    {
      Response response = await  dio.get('GetLandmark/${City}/${id}');
      print(response.data.toString());
      print("pepe");
      // final dynamic one = response.data;
      // final AddPlacesModel Land = response.data.map((e) => AddPlacesModel.fromJson(e)).toList();
      // return Land;
      return AddPlacesModel.fromJson(response.data);
      // return response.data;
   
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
        return null!;
    }
  }



}