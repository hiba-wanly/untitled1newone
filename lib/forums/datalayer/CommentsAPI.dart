import 'package:dio/dio.dart';

class CommentsAPI{

  late Dio dio;

  CommentsAPI(){
    BaseOptions options = BaseOptions(baseUrl: "http://192.168.43.59:8000/api/",
        receiveDataWhenStatusError: true,
        connectTimeout: 60*1000,//60 seconds
        receiveTimeout: 60*1000 // 60 seconds
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> GetAllComments(dynamic Product_ID, String Token) async
  {
    try
    {
      Response response = await  dio.get('products/${Product_ID}/comments', options :Options(headers: {'Accept': 'application/json',
        'Authorization':'Bearer '+'${Token}'
      } ));

      print('comments ='+"${response.data['Big data']['data']}");
      return  response.data['Big data']['data'];

    } catch(e)
    {
      print(e.toString()+"here is the error");
      return[];
    }
  }

  Future AddComment(String Comment, String Token, dynamic product_id) async
  {
    try {
      Map<String,dynamic> commentMessage= {'message':Comment};
      Response response = await dio.post('products/${product_id}/comments/store',data:commentMessage,options: Options(headers: {'Accept': 'application/json',
        'Authorization':'Bearer '+'${Token}'
      } ));
      print('Add Product Response =' + "${response.data}");
    } on DioError catch (e) {
      if (e.response != null) {

        print(e.response);
      }

      else {
        print("error due to sending the request");
      }
    }
  }


}


