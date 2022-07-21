abstract class RestaurantState{}

class RestaurantInitState  extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoadedState extends RestaurantState {}

class RestaurantLoadingErrorState extends RestaurantState {
  final String message;
  RestaurantLoadingErrorState({required this.message});
}