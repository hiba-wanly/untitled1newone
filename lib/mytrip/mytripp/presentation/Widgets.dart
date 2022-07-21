
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';



Widget CountryWidget(Country country)
{
  return Row(children: [
    CircleAvatar(backgroundImage: AssetImage("icons/flags/png/${country.Code}.png",package: 'country_icons')),
    SizedBox(width: 10,) ,
    Text(country.Name)],

  );
}
