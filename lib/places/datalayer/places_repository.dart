import 'package:untitled1newone/places/datalayer/places_model.dart';
import 'package:untitled1newone/places/datalayer/places_service.dart';

class PlacesRepository{
  PlacesApi placesapi = PlacesApi();
  
  Future<List<AddPlacesModel>> GetPlaces(String City) async{
    final state = await placesapi.GetPlaces(City);
    return state.map((e) => AddPlacesModel.fromJson(e)).toList();
  }
}