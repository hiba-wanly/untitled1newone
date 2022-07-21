import 'package:untitled1newone/login/datalayer/Login_Model.dart';
import 'package:untitled1newone/register/datalayer/WebServices(API).dart';

class LoginRepository{

  final AuthAPI LoginAPI;

  LoginRepository(this.LoginAPI);


  int Login(LoginModel Model) //must be futre async
  {
    print("inside repositoty");
    Map<String,dynamic>Json= Model.LoginToJson();
    //await LoginAPI.Login(Json);
    return 200;
  }


}