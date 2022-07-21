import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/Forums/Forums.dart';
import 'package:untitled1newone/bottomnavigationbar/MyTrip.dart';
import 'package:untitled1newone/bottomnavigationbar/coins.dart';
import 'package:untitled1newone/bottomnavigationbar/favorite.dart';
import 'package:untitled1newone/Forums/Forums.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_bloc/currency_states.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_bloc/currrency_cubit.dart';
import 'package:untitled1newone/forums/businesslogic/Forums_Cubit.dart';
import 'package:untitled1newone/forums/businesslogic/Forums_States.dart';
import 'package:untitled1newone/forums/datalayer/Comment_Repository.dart';
import 'package:untitled1newone/forums/datalayer/CommentsAPI.dart';
import 'package:untitled1newone/main_screen/main_screen.dart';
import 'package:untitled1newone/bottomnavigationbar/question.dart';
import 'package:untitled1newone/homelayout/bloc/home_state.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  List<Widget> screens = [
    Favorite(),
    // Coins(),
    BlocProvider(create:(BuildContext context)=>CurrencyCubit(CurrencyInitialState()),child: CurrencyExchange()),
    Main(),
    // Question(),
    BlocProvider(create:(BuildContext context)=>ForumsCubit(ForumsInitialState(),CommentsRepository(CommentsAPI())),child: Forums()),
    MyTrip(),
  ];

  final items = <Widget> [
    Center(child:Icon(Icons.favorite ,)),
    Center(child:Icon(Icons.attach_money , )),
    Center(child:Icon(Icons.home_rounded ,)),
    Center(child:Icon(Icons.edit ,)),
    Center(child:Icon(Icons.home_repair_service_rounded , )),
  ];

  int currentIndex = 2;

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNabBarState());
  }


}

