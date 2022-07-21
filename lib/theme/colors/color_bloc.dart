import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/theme/colors/color_state.dart';
import 'package:untitled1newone/theme/preferences.dart';
import 'package:untitled1newone/theme/preferences.dart';


class ColorCubit extends Cubit<ColorState>{
  ColorCubit() : super(ColorInitialState());

  static ColorCubit get(context) => BlocProvider.of(context);

  bool isDark = true;
  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(ColorChangeState());
    }
    else{
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ColorChangeState());
      });
    }
  }

  void printvalue(){
    print(isDark);
  }

}

