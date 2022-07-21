import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';
import 'package:untitled1newone/places/datalayer/places_service.dart';
// import 'package:untitled1newone/StartScreen/Business%20Logic(bloc)/StartScreen_States.dart';
// import 'package:untitled1newone/StartScreen/Data%20Layer/DataModel.dart';
// import 'package:untitled1newone/StartScreen/Data%20Layer/StartScreen(Api).dart';
import 'package:untitled1newone/startscreen/data_layer/datamodel.dart';
import 'package:untitled1newone/startscreen/data_layer/startscreenapi.dart';
import 'package:untitled1newone/startscreen/business_logic/startscreen_states.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';

class TripCubit extends Cubit<TripStates> {
  TripCubit(TripStates initialState) : super(initialState);

  late Country Choice; // to help swap the values of "From" and "To" DropDownButtons
  late Country Choice2; // to save the choice of the "To"  DropDownButton
  int Adults = 1;
  int Kids = 0;
  int Infants = 0;
  DateTimeRange dateTimeRange= DateTimeRange(start: DateTime.now(),
      end: (DateTime.now()).add(new Duration(days: 7)));

  StartApi ss = StartApi();

  List<DataModel> imagelist = [];

  PlacesApi placesapi = PlacesApi();

  List<AddPlacesModel> citylist = [];

  int selectedindex = 0;

  SavePreferences(Country From, Country To,DateTimeRange dateTimeRange, int Adults, int kids, int infants) {
    this.Choice = From;
    this.Choice2 = To;
    this.dateTimeRange=dateTimeRange;
    this.Adults = Adults;
    this.Kids = kids;
    this.Infants=infants;



    print("choice1 :"+this.Choice.toString() +","+
        "choice2 :"+ this.Choice2.toString() +","+
        "date time range:" +this.dateTimeRange.toString()+","
        "adults :"+this.Adults.toString()+","+
        "kids:"+this.Kids.toString()+","+
        "infants:"+this.Infants.toString());

    emit(FromMyTripToStart(Choice, Choice2,this.dateTimeRange ,this.Adults, this.Kids,
        this.Infants));
  }




  getImages(String type,int index) async  {

    this.selectedindex = index;
    print("index :"+selectedindex.toString());

    emit(ImagesLoading());

    final Places = await  ss.GetImages(type);

    this.imagelist = Places.map((e) => DataModel.fromJson(e)).toList();

    emit(ImagesLoaded(this.imagelist));

    print(imagelist);

  }

  
  GetPlacesRequest(String city,int index) async {

    this.selectedindex = index;

    emit(PlacesLoadingS());

    final PlacesC = await  ss.GetPlaces(city);

    print("mt");

    this.imagelist = PlacesC.map((e) => DataModel.fomLandmarks(e)).toList();

    emit(PlacesLoadedS(this.imagelist));

    print(imagelist);
   
  }

  



}
