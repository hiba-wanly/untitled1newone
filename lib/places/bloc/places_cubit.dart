import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/places/bloc/places_states.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';
import 'package:untitled1newone/places/datalayer/places_service.dart';



class PlacesCubit extends Cubit<PlacesState>
{

  PlacesCubit(PlacesState initialState) : super(initialState);

  // static PlacesCubit get(context) => BlocProvider.of(context);
  
  PlacesApi placesapi = PlacesApi();

  late AddPlacesModel cityy;

  GetOnePlaceRequest(String city, int id) async {

    print(id);

    emit(PlacesLoading());

    print("object");

    final Place1 = await  placesapi.GetOnePlace(city, id);
    
    print(Place1);

    emit(PlacesLoadedState(Place1));

    print("hibi");

    //  return Place1;
  } 




  // GetPlacesRequest(String city) async {

  //   emit(PlacesLoading());

  //   final Places = await  placesapi.GetPlaces(city);

  //   this.citylist = Places.map((e) => AddPlacesModel.fromJson(e)).toList();

  //   emit(PlacesLoadedState(this.citylist));

  //   print(citylist);
    
  //   // final state = await places.GetPlaces(city);
  //   // final req = state.map((char) => AddPlacesModel.fromJson(char)).toList();
  //   // req.then((chare){
  //   //   emit(PlacesLoadedState());
  //   // });
  // }


  



}









// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled1newone/places/bloc/places_states.dart';
// import 'package:untitled1newone/places/datalayer/places_model.dart';
// import 'package:untitled1newone/places/datalayer/places_repository.dart';
// import 'package:untitled1newone/places/datalayer/places_service.dart';



// class PlacesCubit extends Cubit<PlacesState>
// {
//   final PlacesRepository placerepo;

//   PlacesCubit(this.placerepo) : super(PlacesInitState());

//   static PlacesCubit get(context) => BlocProvider.of(context);
  
//   late List<AddPlacesModel> myplace;
  
//   PlacesApi places = PlacesApi();

//   List<AddPlacesModel> GetPlacesRequest(String city) {
//     placerepo.GetPlaces(city).then((char){
//       emit(PlacesLoadedState(char));
//       myplace = char;
//     });
//     return myplace;
//     // final state = await places.GetPlaces(city);
//     // final req = state.map((char) => AddPlacesModel.fromJson(char)).toList();
//     // req.then((chare){
//     //   emit(PlacesLoadedState());
//     // });
//   }

// }