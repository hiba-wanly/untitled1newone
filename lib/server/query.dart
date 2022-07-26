import 'package:intl/intl.dart';
import 'package:untitled1newone/models/components/landmark.dart';
import 'package:untitled1newone/models/offices/airplanes.dart';
import 'package:untitled1newone/models/offices/restaurant.dart';
import 'package:untitled1newone/models/offices/transportion_office.dart';

import '../models/components/car.dart';
import '../models/components/room.dart';
import '../models/offices/hotel.dart';
import '../models/components/flight.dart';

class Query {
  ///hotel query where country is like the selected country and
  ///the where the room is available
  static List<Hotel> queryOnHotels({
    required List<Hotel> source,
    required String country,
  }) {
    return source.where((element) {
      return element.country.toLowerCase().compareTo(country.toLowerCase()) ==
          0;
    }).toList();
  }

  ///
  /// Query on rooms.Source is the fetched list from DB
  /// from is the leaving date and to is returning date
  static List<Room> queryOnRoom({
    required List<Room> source,
    required DateTime from,
    required DateTime to,
  }) {
    return source
        .where((element) =>
            (element.reservedFrom.isAfter(from) &&
                element.reservedUnitl.isAfter(to)) ||
            (element.reservedFrom.isBefore(from) &&
                element.reservedUnitl.isBefore(to)))
        .toList();
  }

  ///
  ///
  static List<Restaurant> queryOnRestaurant(
      {required List<Restaurant> source, required String country}) {
    return source
        .where((element) =>
            element.country.toLowerCase().compareTo(country.toLowerCase()) == 0)
        .toList();
  }

  ///
  ///
  static List<Airplanes> queryOnAirPlanes(
      {required List<Airplanes> source, required String country}) {
    return source
        .where((element) =>
            element.country.toLowerCase().compareTo(country.toLowerCase()) == 0)
        .toList();
  }

  ///
  ///
  static List<Flight> queryOnFlights({
    required List<Flight> source,
    required String from,
    required String to,
    required DateTime dateFrom,
    required DateTime dateTo,
  }) {
    return source.where((element) {
      String from = DateFormat.yMMMEd().format(dateFrom);
      String to =DateFormat.yMMMEd().format(dateTo);
      String fromEl = DateFormat.yMMMEd().format(element.dateFrom);
      String toEl = DateFormat.yMMMEd().format(element.dateTo);
      return (element.from.toLowerCase().compareTo(from.toLowerCase()) == 0 &&
          element.to.toLowerCase().compareTo(to.toLowerCase()) == 0 && from.toLowerCase().compareTo(fromEl.toLowerCase()) == 0&&
      to.toLowerCase().compareTo(toEl.toLowerCase())==0);
    }).toList();
  }

  ///
  ///
  static List<TransportationOffice> queryOnTransportations(
      {required List<TransportationOffice> source, required String country}) {
    return source
        .where((element) =>
            element.country.toLowerCase().compareTo(country.toLowerCase()) == 0)
        .toList();
  }

  ///
  ///
  static List<Landmark> queryOnLandmark({
    required List<Landmark> source,
    required String country,
  }) {
    print(source.first.location['country']);
    return source
        .where((element) =>
            element.location['country']
                .toString()
                .toLowerCase()
                .compareTo(country.toLowerCase()) ==0)
        .toList();
  }

  ///
///
 static List<Car> queryOnCar({
  required List<Car> source,
   required int capacity
}){
    return source.where((element) {
      return element.capacity == capacity;
    }).toList();
 }

}
