import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/drawer/drawer.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/login/bloc/Cubit_Login.dart';
import 'package:untitled1newone/login/bloc/States_Login.dart';
import 'package:untitled1newone/login/datalayer/Login_Model.dart';
import 'package:untitled1newone/login/datalayer/Login_Repository.dart';
import 'package:untitled1newone/register/presentation/Register_Screen.dart';
import 'package:untitled1newone/register/presentation/widget/Loading_State.dart';

import '../../homelayout/homelayout.dart';


class myLogin extends StatefulWidget {
  @override
  State<myLogin> createState() => _myLoginState();
}

class _myLoginState extends State<myLogin> {
  final formKey = GlobalKey<FormState>();

  var passoredcontroller = TextEditingController();

  var emailcontroller = TextEditingController();



  bool obscureText = true;


  LoginModel loginModel = LoginModel();

  late final LoginRepository loginRepository;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(LoginInitState()),
      child:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: DrawerWidget(),
        ),
        body: SafeArea(

          child: SingleChildScrollView(

            child:   Form(

              key: formKey,

              child: Column(

                children: [

                  Container(

                    height: 250,

                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),),

                        color:  Color.fromARGB(255, 9, 80, 139),

                        image: DecorationImage(fit: BoxFit.cover,

                            image: AssetImage('images/airplane - Copy.gif'))

                    ),



                  ),

                  Container(

                    child:  BlocConsumer<LoginCubit,LoginState>(

                        listener:(context, state) {



                          if(state is AdminLoadingSucceccState)

                            Navigator.push(context , MaterialPageRoute(builder: (context) => HomeLayout()));



                          if (state is LoadingErrorState)

                            ScaffoldMessenger.of(context).showSnackBar(

                                SnackBar(content: Text(state.message)));





                        },builder: (context,state){

                      if(state is LoginLoading)

                        return LoadingWidget();



                      // if (state is LoadingErrorState)

                      //    return Center(child: Text(state.message));



                      else

                        return Column(

                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [

                            SizedBox(

                              height: 5.0,

                            ),

                            Text(
                             LocalizationCubit.get(context).localization ? ' تسجيل دخول' : 'Login',
                              // S.of(context).pageLogin,

                              style: Theme.of(context).textTheme.headline1,

                            ),



                            SizedBox(

                              height: 5.0,

                            ),



                            Email(),

                            SizedBox(

                              height: 10,

                            ),

                            password(),



                            SizedBox(

                              height: 30,

                            ),

                            Container(

                              margin: EdgeInsets.only(left: 20, right: 20, top: 10),

                              padding: EdgeInsets.only(left: 20, right: 20),

                              alignment: Alignment.center,

                              decoration: BoxDecoration(gradient: LinearGradient(colors: [
                               (new Color(0xffef9b0f)),
                                      new Color(0xffffba00)
                                ],

                                  begin: Alignment.centerLeft,

                                  end: Alignment.centerRight

                              ),borderRadius: BorderRadius.circular(50),

                                boxShadow: [

                                  BoxShadow(

                                      offset: Offset(0, 10),

                                      blurRadius: 50,

                                      color: Color(0xffEEEEEE)

                                  ),

                                ],

                              ),

                              //width: double.infinity,



                              child: MaterialButton(

                                onPressed: (){

                                  if (formKey.currentState!.validate()) {



                                    print("Button Clicked");



                                    this.loginModel.Email=emailcontroller.text;

                                    this.loginModel.Password=passoredcontroller.text;

                                    //BlocProvider.of<LoginCubit>(context).SendRequest(loginModel);



                                  }

                                },

                                child: Text(

                                  // S.of(context).pageLogin,
                                  LocalizationCubit.get(context).localization ? ' تسجيل دخول' : 'Login',

                                  style: TextStyle(color: Colors.white),

                                ),

                              ),

                            ),

                            SizedBox(height: 10,),
                            Container(

                              margin: EdgeInsets.only(left: 20, right: 20, top: 10),

                              padding: EdgeInsets.only(left: 20, right: 20),

                              alignment: Alignment.center,


                              //width: double.infinity,

                              child: MaterialButton(

                                onPressed: (){
                                  Navigator.of(context).push(SlideRight(Page: Register()));

                                },

                                child: Text(

                                  // S.of(context).pageRegister,
                                  LocalizationCubit.get(context).localization ? ' انشاء حساب' : 'Register',

                                  style: Theme.of(context).textTheme.headline5,

                                ),

                              ),

                            ),

                          ],

                        );



                    }),
                  ),









                ],

              ),

            ),

          ),

        ),



      ),

    );

  }
  _outlineBorder({Color? borderColor}) {
    if (borderColor == null)
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      );
    else
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: borderColor),
      );
  }
  Widget Email(){

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Color(0xffEEEEEE)
          ),
        ],
      ),
      child: TextFormField(
        controller: emailcontroller,
        keyboardType: TextInputType.emailAddress,

        cursorColor: Color(0xffef9b0f),

        onFieldSubmitted: (value){
          print(value);
        },

        validator: (value){
          if(value!.isEmpty||!value.contains('@')||!value.contains('.com')){
            return LocalizationCubit.get(context).localization ? ' يجب ادخال الحساب' : 'email address required';// S.of(context).pageEmailAddress;
          }
          return null;
        },


        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Color(0xffef9b0f),
          ),

          hintText: LocalizationCubit.get(context).localization ? ' ادخل الحساب' : 'Enter Email',//S.of(context).pageEnterEmail,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );

  }
  Widget password(){
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xffEEEEEE),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 100,
              color: Color(0xffEEEEEE)          ),
        ],
      ),
      child: TextFormField(
        controller: passoredcontroller,
        obscureText: obscureText,
        keyboardType: TextInputType.visiblePassword,

        cursorColor: Color(0xffef9b0f),
        decoration: InputDecoration(
          focusColor: Color(0xffef9b0f),
          icon: Icon(
            Icons.vpn_key,
            color: Color(0xffef9b0f),
          ),
          hintText: LocalizationCubit.get(context).localization ? ' كلمة المرور' : 'Enter Password',//S.of(context).pageEnterPassword,
 enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                obscureText =  !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Color(0xffef9b0f),
            ),
          ),
        ),
        onFieldSubmitted: (value){
          print(value);
        },
        validator: (value){
          if(value!.isEmpty){
            return LocalizationCubit.get(context).localization ? ' يجب كتابة كلمة المرور' : 'password must not be empty';//S.of(context).pagePasswordAddress;

          }
          return null;
        },
      ),
      // enabledBorder: InputBorder.none,
      //   focusedBorder: InputBorder.none,
    );

  }
}

