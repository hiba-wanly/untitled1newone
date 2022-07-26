import 'package:untitled1newone/models/offices/office.dart';

class TouristOffice extends Office {
  String id;
  List<String> tours_id;

  TouristOffice(
      {required this.id,
      required this.tours_id,
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


  factory TouristOffice.fromJson(Map json){
    return TouristOffice(id: json['id'],
        tours_id: json['tours_id'],
        country: OfficeBase.fromLocation(json['location'], 0),
        stars: json['stars'] ?? 0,
        phone: json['phone'],
        imagesPath: json['image_path'],
        description: json['description'],
        address: json['address'],
        account: json['account'],
        name: json['name'],
        area: OfficeBase.fromLocation(json['location'], 2),
        city: OfficeBase.fromLocation(json['location'], 1));
  }


  Map<String, dynamic> joJson() {
    return {
      "name":name,
      "tours":tours_id,
      "location":"$country/$city/$area",
      "stars":stars,
      "phone":phone,
      "images":imagesPath,
      "description":description,
      "account":account,

    };
  }
}
