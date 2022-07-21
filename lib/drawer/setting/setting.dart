import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/drawer/drawer.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/localization/localization_state.dart';
import 'package:untitled1newone/theme/colors/color_bloc.dart';
import 'package:untitled1newone/theme/colors/color_state.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  //bool isSwitched = true;
  // bool isSwitched1 = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ColorCubit,ColorState>(
      listener:(context,state){},
      builder: (context,state){
        return BlocConsumer<LocalizationCubit, LocalizationState>(
          listener:(context,state){},
          builder: (context,state){
            return Scaffold(
              appBar: AppBar(
                title: Align(
                  alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                  child: Text(
                    LocalizationCubit.get(context).localization ? ' الاعدادت' : 'setting',
                    // S.of(context).pageSetting,
                  ),
                ),
                leading: DrawerWidget(),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                      child: Text(
                        // S.of(context).pageChangeMode,
                        LocalizationCubit.get(context).localization ? ' تغيير اللون' : 'change mode',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                      child: Container(
                        alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                        width: 230,
                        child: Row(
                          children: [
                            Text(
                              // S.of(context).pageLightMode,
                              LocalizationCubit.get(context).localization ? ' ساطع' : 'Light',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(width: 10,),
                            Switch(
                              value: ColorCubit.get(context).isDark,
                              onChanged: (value){
                                setState(() {
                                  ColorCubit.get(context).changeAppMode();
                                  ColorCubit.get(context).isDark = value;
                                  ColorCubit.get(context).printvalue();
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Text(
                              // S.of(context).pageDarkMode,
                                 LocalizationCubit.get(context).localization ? ' مظلم' : 'Dark',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                      child: Text(
                        // S.of(context).pageChangeLan,
                        LocalizationCubit.get(context).localization ? ' تغير اللغة' : 'change Language',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                      child: Container(
                        alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                        width: 220,
                        child: Row(
                          children: [
                            Text(
                              // S.of(context).pageHomeListTitle,
                              LocalizationCubit.get(context).localization ? ' الانكليزي' : 'ُEnglish',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(width: 10,),
                            Switch(
                              value: LocalizationCubit.get(context).localization,
                              onChanged: (value){
                                setState(() {
                                  LocalizationCubit.get(context).localization ? S.load(const Locale('en')) : S.load(const Locale('de'));
                                  LocalizationCubit.get(context).changeAppLan();
                                  LocalizationCubit.get(context).localization = value;
                                  LocalizationCubit.get(context).printvalue();
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            Text(
                              LocalizationCubit.get(context).localization ? ' عربي' : 'Arabic',
                              // S.of(context).pageArabicTitle,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
