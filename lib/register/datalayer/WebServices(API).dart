import 'package:dio/dio.dart';


class AuthAPI{

  late Dio dio;

  AuthAPI(){
    BaseOptions options = BaseOptions(baseUrl: "something,something.com",
        receiveDataWhenStatusError: true,
        connectTimeout: 60*1000,//60 seconds
        receiveTimeout: 60*1000 // 60 seconds
    );
    dio = Dio(options);
  }

  Future Register(Map<String,dynamic>Info) async
  {
    try {
      FormData Regitserdata = FormData.fromMap(Info);
      Response response = await dio.post('Register', data: Regitserdata);
      print('Register Response =' + "${response.data}");


      return response;
    }
    on DioError catch (e) {
      if (e.response != null) {
        print("error due to dio");
        print(e.response);
      }
      else {
        print("error due to sending the request");
      }
      return e.response;
    }
  }


  Future Login(Map<String,dynamic> Info) async
  {
    try {
      print("inside web services");
      Response response = await dio.post('login', data:Info );
      print('Login Response =' + "${response.data}");

      if (response.statusCode == 200) {
        return response.data["token"];
      }

      else {
        return response.statusMessage;
      }
    }


    on DioError catch (e) {
      // if (e.response != null)
      // {
      //   print("error due to dio Login Request");
      //   print(e.response);
      //   return e.message;
      //
      // }
      // else {
      //   print("error due to login");
      //   return e.message;
      // }
      return e.message;

    }
  }



}
