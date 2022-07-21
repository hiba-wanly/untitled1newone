
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/mytrip/mytripp/businesslogic/States_MyTrip.dart';


import '../../MyTrip.dart';

class MyTripCubit extends Cubit<MyTripStates>
{
  final items = [Country("Saudi Arabia", "sa"),Country("Syria", "sy"), Country("Egypt", "eg")];
  Country? Choice;
  Country? Choice2;

  MyTripCubit(MyTripStates initialState) : super(initialState);


  UpdateChoice1(Country? ChoiceX)
  {
    this.Choice=ChoiceX;
    print("Choice1 Updated");
    print(this.Choice!.Name);
    emit(Choice1Updated());

  }

  UpdateChoice2(Country? ChoiceX)
  {
    this.Choice2=ChoiceX;
    print("Choice2 Updated");
    print(this.Choice2!.Name);
    emit(Choice2Updated());

  }





}