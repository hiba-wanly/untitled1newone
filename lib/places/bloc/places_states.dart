import 'package:untitled1newone/places/datalayer/places_model.dart';

abstract class PlacesState{}

class PlacesInitState  extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesLoadedState extends PlacesState {
  final AddPlacesModel place;

  PlacesLoadedState(this.place);
}

class PlacesLoadingErrorState extends PlacesState {
  final String message;

  PlacesLoadingErrorState({required this.message});
}