import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_state.dart';
import 'package:untitled1newone/localization/preferences_loc.dart';



class LocalizationCubit extends Cubit<LocalizationState>{
  LocalizationCubit() : super(LocalizationInitialState());

  static LocalizationCubit get(context) => BlocProvider.of(context);

  bool localization = true;

  void changeAppLan({bool? fromSharedLan}){
    if(fromSharedLan != null){
      localization = fromSharedLan;
      // S.load(const Locale('en'));
      emit(LocalizationChangeState());
    }
    else {
      localization = !localization;
      Preferences.putBooleanLan(key: 'localization', value: localization).then((value) {
        // S.load(const Locale('de'));
        emit(LocalizationChangeState());
      });
    }
  }

  void printvalue(){
    print(localization);
  }
}

