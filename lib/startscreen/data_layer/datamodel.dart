

import 'package:untitled1newone/places/datalayer/places_model.dart';

class DataModel {
  static String BaseUrl = "http://192.168.43.59:8000";

  late String name;
  late String rating;
  late String type;
  late String image;

  DataModel(
      {required this.name,
      required this.rating,
      required this.type,
      required this.image});

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rating = json['rating'];
    type = json['type'];
    image = BaseUrl + json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['type'] = this.type;
    data['image'] = this.image;
    return data;
  }

  DataModel.fomLandmarks(AddPlacesModel Landmark) {
    print("ttt");
    name = Landmark.name;
    type = "Landmarks";
    rating = Landmark.stars.toString();
    image = Landmark.img1path;
  }
  
}
