//TODO:implement this class
import 'package:untitled1newone/models/offices/office.dart';

class Comments {}

class Hotel extends Office {
  String id;
  List<String> roomID;
  List<Comments> comments;

  Hotel(
      {required this.id,
      required this.comments,
      required this.roomID,
      required super.country,
      required super.stars,
      required super.phone,
      required super.imagesPath,
      required super.description,
      required super.address,
      required super.account,
      required super.name,
      required super.area,
      required super.city});



  factory Hotel.fromJson(Map json){
    return Hotel(
        id: json['id'],
        comments: (json['comments']??[]),
        roomID: (json['room_id']??[]),
        country: OfficeBase.fromLocation(json['location'], 0),
        stars: Office.convertList(json['stars'] ?? [0,0,0,0,0]),
        phone:Office.convertHashToMap( json['phone']),
        imagesPath:Office.convertListOfString(json['images']),
        description: json['description'],
        address: Office.convertHashToMap(json['address']),
        account: json['account'],
        name: json['name'],
        area: OfficeBase.fromLocation(json['location'], 2),
        city: OfficeBase.fromLocation(json['location'], 1));
  }


  Map<String, dynamic> joJson() {
    return {
      "name":name,
      "rooms":roomID,
      "location":"$country/$city/$area",
      "stars":stars,
      "phone":phone,
      "images":imagesPath,
      "description":description,
      "account":account,
      "comments":comments,
      "address":address
    };
  }
}
