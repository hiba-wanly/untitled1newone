
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/forums/businesslogic/Forums_Cubit.dart';
import 'package:untitled1newone/forums/businesslogic/Forums_States.dart';
import 'package:untitled1newone/forums/datalayer/Comment_Repository.dart';
import 'package:untitled1newone/forums/datalayer/CommentsAPI.dart';
import 'package:untitled1newone/login/bloc/Cubit_Login.dart';
import 'package:untitled1newone/login/bloc/States_Login.dart';
import 'package:untitled1newone/login/datalayer/Login_Repository.dart';
import 'package:untitled1newone/register/bloc/Cubit_Register.dart';
import 'package:untitled1newone/register/bloc/States_Register.dart';
import 'package:untitled1newone/register/datalayer/Regitser_Repository.dart';
import 'package:untitled1newone/register/datalayer/WebServices(API).dart';
import 'package:untitled1newone/splashscreen.dart';
// import 'package:trip/MyTrip/Business%20Logic/Cubit_MyTrip.dart';
// import 'package:trip/MyTrip/Business%20Logic/States_MyTrip.dart';

class AppRouter{
  late LoginRepository loginRepository;
  late LoginCubit loginCubit;

  late RegisterRepository registerRepository;
  late RegisterCubit registerCubit;

  late ForumsCubit forumsCubit;
  late CommentsRepository commentsRepository;


  // late MyTripCubit myTripCubit;


  AppRouter(){
    loginRepository= LoginRepository(AuthAPI());
    loginCubit = LoginCubit(LoginInitState());

    registerRepository = RegisterRepository(AuthAPI());
    registerCubit = RegisterCubit(initialState());

    commentsRepository= CommentsRepository(CommentsAPI());
    forumsCubit= ForumsCubit(ForumsInitialState(), commentsRepository);

    // myTripCubit= MyTripCubit(MyTripInitialState());


  }

  Route? generateRoute(RouteSettings Settings){
    switch(Settings.name)
    {
      case '/':
        return MaterialPageRoute(builder: (_)=>MultiBlocProvider(providers: [BlocProvider(create:(BuildContext context)=>loginCubit),
          BlocProvider(create: (BuildContext context)=>registerCubit),
          // BlocProvider(create:(BuildContext context)=>myTripCubit),],
          BlocProvider(create: (BuildContext contex)=>forumsCubit),
        ],

            child: SplashScreen()
        )
        );

      case '/Existing_Cards':
        return MaterialPageRoute(builder: (_)=>MultiBlocProvider(providers: [BlocProvider(create:(BuildContext context)=>loginCubit),
          BlocProvider(create: (BuildContext context)=>registerCubit),
          // BlocProvider(create:(BuildContext context)=>myTripCubit),],
          BlocProvider(create: (BuildContext contex)=>forumsCubit),
        ],

            child: SplashScreen()
        )
        );




    }
  }
}