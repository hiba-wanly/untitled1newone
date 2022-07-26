import 'package:flutter/material.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';
// import 'package:untitled1newone/StartScreen/Data%20Layer/DataModel.dart';
// import 'package:untitled1newone/mytrip/MyTrip.dart';
import 'package:untitled1newone/startscreen/data_layer/datamodel.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';

abstract class TripStates{}

class initialTripState extends TripStates{}

class ImagesLoading extends TripStates{}

class PlacesLoadingS extends TripStates {}

class PlacesLoadedS extends TripStates {
  final List<DataModel> placelist;

  PlacesLoadedS(this.placelist);
}


class ImagesLoaded extends TripStates{
  final List<DataModel> Imagelist;

  ImagesLoaded(this.Imagelist);

}

class HotelsLoaded extends TripStates{
  final List<DataModel> Imagelist;

  HotelsLoaded(this.Imagelist);

}

class FlightsLoaded extends TripStates{
  final List<DataModel> Imagelist;

  FlightsLoaded(this.Imagelist);

}

class RestaurantsLoaded extends TripStates{
  final List<DataModel> Imagelist;

  RestaurantsLoaded(this.Imagelist);

}

class TransportationsLoaded extends TripStates{
  final List<DataModel> Imagelist;

  TransportationsLoaded(this.Imagelist);

}

class LandmarksLoaded extends TripStates{
  final List<DataModel> Imagelist;

  LandmarksLoaded(this.Imagelist);

}



class FromMyTripToStart extends TripStates{
  final Country Choice;     // to help swap the values of "From" and "To" DropDownButtons
  final Country Choice2;    // to save the choice of the "To"  DropDownButton
  final DateTimeRange dateTimeRange;
  final int Adults;
  final int Kids;
  final  int Infants;



  FromMyTripToStart(this.Choice,
      this.Choice2,
      this.dateTimeRange,
      this.Adults,
      this.Kids,
      this.Infants,
      );

}
