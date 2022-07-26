import 'package:flutter/material.dart';

abstract class OfficeBase {
  String name;
  String city;
  String country;
  String area;
  List<int> stars;
  Map<String,String> phone;
  Map<String, String> address;
  String description;
  List<String> imagesPath = List.empty(growable: false)
    ..length = 3;
  String account;

  OfficeBase({required this.name,
    required this.account,
    required this.address,
    required this.description,
    required this.imagesPath,
    required this.city,
    required this.country,
    required this.area,
    required this.phone,
    required this.stars});

  static String fromLocation(String location,int i){
   return   location.split('/')[i];
  }
}


class Office implements OfficeBase {
  @override
  String account;

  @override
  Map<String, String> address;

  @override
  String area;

  @override
  String city;

  @override
  String country;

  @override
  String description;

  @override
  List<String> imagesPath;

  @override
  String name;

  @override
  Map<String,String> phone;

  @override
  List<int> stars;

  Office({
    required this.country,
    required this.stars,
    required this.phone,
    required this.imagesPath,
    required this.description,
    required this.address,
    required this.account,
    required this.name,
    required this.area,
    required this.city
  });


  factory Office.fromJson(Map json){
    try {
      return Office(
          country: OfficeBase.fromLocation(json['location'], 0),
          stars: json['stars'],
          phone: convertHashToMap(json['phone']),
          imagesPath: json['image_path'],
          description: json['description'],
          address:convertHashToMap( json['address']),
          account: json['account'],
          name: json['name'],
          area: json['area'],
          city: json['city']);
    } on Exception catch (e) {
      throw "Error happened while trying to decode office";
    }
  }

  static Map<String,String> convertHashToMap(Map map){
    Map<String,String> res={};
    map.forEach((key, value) { 
      res.addAll({key.toString():value.toString()});
    });
    return res;
  }
  
  static List<int> convertList(List json){
    List<int> res = [];
    for(var i in json){
      if(i is int){
        res.add(i);
      }else if (i is double){
        res.add(i.toInt());
      }else {
        continue;
      }
    }
    return res;
  }


  static List<String> convertListOfString(List json){
    List<String> res = [];
    for(var i in json){
     res.add(i.toString());
    }
    return res;
  }

}
