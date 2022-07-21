import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/restaurant/bloc/restaurant_states.dart';



class RestaurantCubit extends Cubit<RestaurantState>
{

  RestaurantCubit(RestaurantState initialState) : super(initialState);

  static RestaurantCubit get(context) => BlocProvider.of(context);
  
  


}