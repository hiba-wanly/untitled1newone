import 'dart:io';

class RegisterModel {

  late String Name;
  late String Phone;
  late String Email;
  late String Password;
  late File Image;


  Map<String, dynamic> RegisterToJson() {
    return {
      'Name': this.Name,
      'Phone': this.Phone,
      'Email': this.Email,
      'Pssword': this.Password,
      'Image': this.Image
    };
  }
}