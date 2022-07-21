class LoginModel{

  late String Email;
  late String Password;



  Map<String,dynamic> LoginToJson()
  {
    return {
      'Email':this.Email,
      'Password':this.Password
    };
  }



}