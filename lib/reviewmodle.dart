import 'dart:ui';

import 'package:flutter/material.dart';

final reviewList = [
  ReviewModal(
    image:'images/wifi.png' ,
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image:'images/wifi.png' ,
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image:'images/wifi.png' ,
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),
  ReviewModal(
    image:'images/wifi.png' ,
    name: "John Travolta",
    rating: 3.5,
    date: "01 Jan 2021",
    comment:
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  ),



];

//reviewmodel
class ReviewModal {
  late String image;
  late String name;
  late double rating;
  late String date;
  late String comment;

  ReviewModal({required this.image,required this.name,required this.rating,required this.date,required this.comment});

  ReviewModal.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    rating = json['rate'];
    date = json['date'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    data['rate'] = this.rating;
    data['date'] = this.date;
    data['comment'] = this.comment;
    return data;
  }
}
const kPrimaryColor = Color(0xFFFF8084);
const kAccentColor = Color(0xFFF1F1F1);
const kWhiteColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF808080);
const kDarkColor = Color(0xFF303030);
const kTransparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;

const kShape = 30.0;

const kRadius = 0.0;
const kAppBarHeight = 56.0;
