import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:untitled1newone/homelayout/bloc/home_bloc.dart';
import 'package:untitled1newone/homelayout/bloc/home_state.dart';
import 'package:untitled1newone/theme/colors/color.dart';



class HomeLayout extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (BuildContext context, AppState state) {},
          builder: (BuildContext context, AppState state)
          {
            AppCubit cubit = AppCubit.get(context);

            return Container(
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: SafeArea(
                child: ClipRect(
                  child: Scaffold(
                    extendBody: true,
                    backgroundColor: Colors.white,
                    body: cubit.screens[cubit.currentIndex],
                    bottomNavigationBar: Theme(
                      data: Theme.of(context).copyWith(
                        // iconTheme: IconThemeData(
                        //     color: Colors.orange,
                        // ),
                      ),
                      child: CurvedNavigationBar(
                        // buttonBackgroundColor: LightColors.cc,
                        // color: LightColors.bb,
                          color: Theme.of(context).bottomAppBarColor,
                          buttonBackgroundColor: Colors.transparent,//Theme.of(context).appBarTheme.backgroundColor,
                          backgroundColor: Colors.transparent,
                          height: 48,
                          animationCurve: Curves.easeInOut,
                          animationDuration: Duration(milliseconds: 300),
                          index: cubit.currentIndex,
                          items:<Widget> [
                            Center(child:Icon(Icons.favorite , color:cubit.currentIndex==0?LightColors.aa:Colors.white)),
                            Center(child:Icon(Icons.attach_money , color:cubit.currentIndex==1?LightColors.aa:Colors.white)),
                            Center(child:Icon(Icons.home_rounded ,color:cubit.currentIndex==2?LightColors.aa:Colors.white)),
                            Center(child:Icon(Icons.edit ,color:cubit.currentIndex==3?LightColors.aa:Colors.white)),
                            Center(child:Icon(Icons.home_repair_service_rounded ,color:cubit.currentIndex==4?LightColors.aa:Colors.white) ),
                          ],
                          onTap: (index) {
                            cubit.changeIndex(index);
                          }
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );

  }


}




