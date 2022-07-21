import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_event.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainState>{
  MainScreenBloc() : super(MainInitialState())
  {
    on<OfferEvent>((event,emit)async{
      emit(OfferScreenState());
    });
    on<ToursEvent>((event,emit)async{
      emit(ToursScreenState());
    });
    on<MainInitialEvent>((event,emit)async{
      emit(MainInitialState());
    });
  }
}