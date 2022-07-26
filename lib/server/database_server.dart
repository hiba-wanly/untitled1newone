import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../models/components/tour.dart';
import '../models/components/user.dart';
import '../models/components/offers.dart';

class DataBaseServer {
  static Future<void> createUser(User user) async {
    return await FirebaseDatabase.instance
        .ref('users')
        .child(user.email.substring(0,user.email.indexOf('.')))
        .set(user.toJson());
  }

  static Future<UploadTask?> uploadPhoto(File file, String userId) async =>
      FirebaseStorage.instance.ref('users_photos').child(userId).putFile(file);

  static Future<String?> addOffer(Offer offer) async {
    return FirebaseDatabase.instance
        .ref('offers')
        .child('first offers')
        .push() //unique id
        .set(offer.toJson())
        .then((value) {
      debugPrint('Offer Added successfully');
      return null;
    }).catchError((e) {
      print(e);
      return "There is error while adding this object";
    });
  }

  static Future<String?> addTour(Tour tour) async {
    return FirebaseDatabase.instance
        .ref('tours')
        .push()
        .set(tour.toJson())
        .then((value) {
      debugPrint('tours Added successfully');
      return null;
    }).catchError((e) {
      print(e);
      return "There is error while adding this object";
    });
  }
}
