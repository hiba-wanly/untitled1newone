import 'package:untitled1newone/models/components/landmark.dart';
import 'package:untitled1newone/models/offices/office.dart';

class Car {
  String id;
  double costPerHour;
  List<String> imagePath;
  Map phone;
  String name;
  int capacity;


  Car({
    required this.id,
    required this.name,
    required this.phone,
    required this.capacity,
    required this.costPerHour,
    required this.imagePath,
  });

  factory Car.fromJson(Map json){
    return Car(
        id: json['id'],
        name: json['name'],
        phone: Office.convertHashToMap(json['phone']??{}),
        capacity: Landmark.convertToInt(json['capacity']),
        costPerHour: convertToDouble(json['cost']),
        imagePath: Office.convertListOfString(json['images']));
  }

  Map toJson(){
    return {
      'name':name,
      'phone':phone,
      'capacity':capacity,
      'cost':costPerHour,
      'images':imagePath,
    };
  }


  static double convertToDouble(var d){
    if(d is double){
      return d;
    }else if (d is int){
      return d.toDouble();
    }else if (d is String){
      return double.tryParse(d)??0;
    }else {
      return d;
    }
  }


}