import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:untitled1newone/models/components/car.dart';
import 'package:untitled1newone/models/components/flight.dart';
import 'package:untitled1newone/models/components/tour.dart';
import 'package:untitled1newone/models/components/landmark.dart';
import 'package:untitled1newone/models/offices/airplanes.dart';
import 'package:untitled1newone/models/offices/restaurant.dart';
import 'package:untitled1newone/models/offices/transportion_office.dart';

import '../models/components/offers.dart';
import '../models/components/room.dart';
import '../models/offices/hotel.dart';

class DataBaseClintServer {
  /// fitch all offers and convert them to offers model
  static Future<List<Offer>?> getAllOffers() async {
    return await FirebaseDatabase.instance.ref('offers').get().then((value) {
      if (value.value != null && value.exists) {
        List<Offer> offers = [];
        Map response = value.value as Map;
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({"id": key});

          offers.add(Offer.fromJson(json));
        });
        return offers;
      } else {
        return null;
      }
    });
  }

  /// fitch all flights and convert them to flight model
  static Future<List<Flight>?> getAllFlight() async {
    return await FirebaseDatabase.instance.ref('flights').get().then((value) {
      if (value.value != null && value.exists) {
        List<Flight> offers = [];
        Map response = value.value as Map;
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({"id": key});

          offers.add(Flight.fromJson(json));
        });
        return offers;
      } else {
        return null;
      }
    });
  }

  /// fitch all tours and convert them to tours model
  static Future<List<Tour>?> getAllTours() async {
    return await FirebaseDatabase.instance.ref('tours').get().then((value) {
      if (value.value != null && value.exists) {
        List<Tour> tours = [];
        Map response = value.value as Map;
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({"id": key});

          tours.add(Tour.fromJson(json));
        });
        return tours;
      } else {
        return null;
      }
    });
  }

  ///in tour we add new rate depending on stars count that user provide
  ///we need old rate to increment the old one.
  static Future<void> updateTourRate(
      {required int newRate, required String id, required int oldRate}) async {
    return await FirebaseDatabase.instance
        .ref('tours')
        .child(id)
        .child('rate')
        .child(newRate.toString())
        .set(oldRate + 1)
        .then((value) => null)
        .catchError((e) {
      debugPrint(e);
        });
  }

  ///here we can add comments to tour the comments is related with use id
  ///so every user have only one comment.
  static Future<void> addCommentToTour(
      {required String userId,
      required String tourId,
      required String comments}) async {
    return await FirebaseDatabase.instance
        .ref('tours')
        .child(tourId)
        .child('comments')
        .set({userId: comments})
        .then((value) => null)
        .catchError((e) {
          debugPrint(e);
        });
  }

  ///increment tours favorite by adding user id to favorite set in database
  static Future<void> incrementToursFavorite(
      {required String userId,
      required String toursId,
      required Set oldFavorite}) async {
    Set newSet = oldFavorite;
    newSet.add(userId);
    debugPrint(newSet.toString());
    return await FirebaseDatabase.instance
        .ref('tours')
        .child(toursId)
        .child('favorite')
        .set(newSet.toList());
  }

  ///decrement favorite by delete user id from favorite set in database
  static Future<void> decrementToursFavorite(
      {required String userId,
      required String toursId,
      required String index}) async {
    return await FirebaseDatabase.instance
        .ref('tours')
        .child(toursId)
        .child('favorite')
        .child(index)
        .remove();
  }

  ///query section
  ///
  ///
  ///  get all hotel
  static Future<List<Hotel>?> getAllHotels() {
    return FirebaseDatabase.instance.ref('hotels').get().then((value) {
      var response = value.value;
      List<Hotel> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(Hotel.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }

  ///
  ///get all rooms
  static Future<List<Room>?> getAllRooms() {
    return FirebaseDatabase.instance.ref('rooms').get().then((value) {
      var response = value.value;
      List<Room> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(Room.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }

  ///get all restaurant
  static Future<List<Restaurant>?> getAllRestaurant() {
    return FirebaseDatabase.instance.ref('restaurants').get().then((value) {
      var response = value.value;
      List<Restaurant> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(Restaurant.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }

  ///get all flight company
  ///
  static Future<List<Airplanes>?> getAllAirplanes() {
    return FirebaseDatabase.instance.ref('airplanes').get().then((value) {
      var response = value.value;
      List<Airplanes> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(Airplanes.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }

  ///get all transportation offices
  ///
  static Future<List<TransportationOffice>?> getAllTransportations() {
    return FirebaseDatabase.instance
        .ref('transportation_office')
        .get()
        .then((value) {
      var response = value.value;
      List<TransportationOffice> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(TransportationOffice.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }

  /// get all cars
  ///
  static Future<List<Car>?> getAllCars() {
    return FirebaseDatabase.instance.ref('cars').get().then((value) {
      var response = value.value;
      List<Car> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(Car.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }

  static Future<List<Landmark>?> getAllLandMarks(){
    return  FirebaseDatabase.instance.ref('touristical_monuments').get().then((value) {
      var response = value.value;
      List<Landmark> result = [];
      if (response == null) {
        return null;
      } else if (response is Map) {
        response.forEach((key, value) {
          Map json = value as Map;
          json.addAll({'id': key});
          result.add(Landmark.fromJson(json));
        });
        return result;
      } else {
        return [];
      }
    });
  }
}
