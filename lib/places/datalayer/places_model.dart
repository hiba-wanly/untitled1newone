import 'dart:io';

import 'package:dio/dio.dart';

class AddPlacesModel{
  late String name;
  late String description;
  late String city;
  late double meridian;
  late double latitudes;
  late int stars;
  late String fromday;
  late String today;
  late double fromtime;
  late double totime;
  late double price;
  late String img1path;
  late File img1;
  late String img2path;
  late File img2;
  late String img3path;
  late File img3;


  AddPlacesModel({
    required this.name,
    required this.description,
    required this.city,
    required this.meridian,
    required this.latitudes,
    required this.stars,
    required this.fromday,
    required this.today,
    required this.fromtime,
    required this.totime,
    required this.price,
    required this.img1,
    required this.img2,
    required this.img3,
  });

  static String BaseUrl = 'http://192.168.43.59:8000';

  AddPlacesModel.fromJson(Map<String, dynamic> json) {
   print("kkk");
    name = json['name'];
    description = json['description'];
    city = json['city'];
    meridian = double.parse(json['meridian']);
    latitudes = double.parse(json['latitudes']);
    stars = int.parse(json['stars']);
    fromday = json['FromDay'];
    today = json['ToDay'];
    fromtime = double.parse(json['FromTime']);
    totime = double.parse(json['ToTime']);
    price = double.parse(json['price']);
    img1path = BaseUrl + json['Image1'];
    if(json['Image2']!=null)
      img2path = BaseUrl + json['Image2'];
    if(json['Image3']!=null)
    img3path = BaseUrl + json['Image3'];

    print("dd");
    
  }


   Future<Map<String,dynamic>>toJson() async
  {
    return {
      'name' : this.name,
      'description' : this.description,
      'city' : this.city,
      'meridian' : this.meridian,
      'latitudes' : this.latitudes,
      'stars' : this.stars,
      'FromDay' : this.fromday,
      'ToDay' : this.today,
      'FromTime' : this.fromtime,
      'ToTime' : this.totime,
      'price' : this.price,
      'Image1' : await MultipartFile.fromFile(img1.path),
      'Image2' : await MultipartFile.fromFile(img2.path),
      'Image3' : await MultipartFile.fromFile(img3.path),
      
    };
  }


}