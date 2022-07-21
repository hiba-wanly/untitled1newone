import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/register/bloc/Cubit_Register.dart';
import 'package:untitled1newone/register/bloc/States_Register.dart';
import 'package:untitled1newone/register/datalayer/Register_Model.dart';
import 'package:untitled1newone/register/datalayer/Regitser_Repository.dart';
import 'package:untitled1newone/register/presentation/widget/DisplayPicture.dart';
import 'package:untitled1newone/register/presentation/widget/Loading_State.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';



class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  var passoredcontroler = TextEditingController();

  var emailcontroler = TextEditingController();

  var ImageControler = TextEditingController();

  var namecontroler = TextEditingController();

  var phonecontroler = TextEditingController();

  bool obscureText = true;
  bool isPassword = true;
  bool isPassword2 = true;

  late RegisterRepository registerRepository;

  late File UserImage;

  final Picker =ImagePicker();

  RegisterModel registerModel = RegisterModel();

  Future getImage(ImageSource src) async{
    final PickedFile = await Picker.pickImage(source: src);
    setState(() {
      if (PickedFile!=null)
      {
        UserImage = File(PickedFile.path);
        BlocProvider.of<RegisterCubit>(context).UpdateImage(UserImage);
        this.registerModel.Image=UserImage;
        print("image loaded");
      }
      else
        print("Could not get photo");

    });
  }

  @override
  void initState() {
    //BlocProvider.of<RegisterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(initialState()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(

                        /// اللون للخلفية الببضاء مع شفافية 10%
                        color: Colors.white.withOpacity(0.10),

                        /// تدوير الحواف
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),

                      child:  BlocBuilder<RegisterCubit,RegisterState>(builder: (context,state){

                        if(state is LoadingState)
                          return LoadingWidget();

                        if(state is SuccessState)
                          return DisplayPicture(DisplayPhoto: state.profileImage);

                        else
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                LocalizationCubit.get(context).localization ? 'انشاء حساب' : 'Register',
                                // S.of(context).pageRegister,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              InkWell(child: ClipOval(
                                  child: Container(width:100, height:100,
                                    child: BlocBuilder<RegisterCubit,RegisterState>(builder:(context,state){
                                      if(state is ImageLoaded)
                                        return Image.file(state.ProfileImage,fit: BoxFit.fill,);

                                      return Image.asset("images/plane.jpg",fit :BoxFit.fill);
                                    }),
                                  )) ,onTap: (){
                                showDialog(context: context, builder: (BuildContext context){  return new AlertDialog(title: Text("Choose Picture From"),
                                  content: Container(height :150,color: Colors.white,child:
                                  Column(children: [
                                    Container(color: Colors.orange,child: ListTile(leading: Icon(Icons.image),title: Text('Gallery'),onTap: ()
                                    {
                                      getImage(ImageSource.gallery);
                                      Navigator.of(context).pop();
                                    },),),
                                    SizedBox(height: 30,),
                                    Container(color: Colors.orange,child: ListTile(leading: Icon(Icons.add_a_photo),title: Text('Camera'),onTap: (){
                                      getImage(ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },),),
                                  ],)),);});
                              },),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
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
        controller: namecontroler,
        keyboardType: TextInputType.name,

        cursorColor: Color(0xffef9b0f),

        onFieldSubmitted: (value){
          print(value);
        },

        validator: (value){
          if(value!.isEmpty||!value.contains('@')||!value.contains('.com')){
            return  LocalizationCubit.get(context).localization ? 'ادخل ' : 'Fill the value';//S.of(context).pageFillValue;
          }
          return null;
        },


        decoration: InputDecoration(
          icon: Icon(
            Icons.drive_file_rename_outline_rounded,
            color: Color(0xffef9b0f),
          ),

          hintText:  LocalizationCubit.get(context).localization ? 'الاسم ' : 'Name',//S.of(context).pageName,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    ),

                             SizedBox(
                                height: 10,
                              ),
                               Container(
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
        controller: phonecontroler,
        keyboardType: TextInputType.phone,

        cursorColor: Color(0xffef9b0f),

        onFieldSubmitted: (value){
          print(value);
        },

        validator: (value){
          if(value!.isEmpty||!value.contains('@')||!value.contains('.com')){
            return  LocalizationCubit.get(context).localization ? 'ادخل ' : 'Fill the value';//S.of(context).pageFillValue;
          }
          return null;
        },


        decoration: InputDecoration(
          icon: Icon(
            Icons.phone,
            color: Color(0xffef9b0f),
          ),

          hintText:  LocalizationCubit.get(context).localization ? 'رقم تواصل ' : 'Phone',//S.of(context).pageYourPhone,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    ),

                             SizedBox(
                                height: 10,
                              ),
                                 Container(
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
        controller: emailcontroler,
        keyboardType: TextInputType.emailAddress,

        cursorColor: Color(0xffef9b0f),

        onFieldSubmitted: (value){
          print(value);
        },

        validator: (value){
          if(value!.isEmpty||!value.contains('@')||!value.contains('.com')){
            return  LocalizationCubit.get(context).localization ? 'ادخل ' : 'Fill the value';//S.of(context).pageFillValue;
          }
          return null;
        },


        decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Color(0xffef9b0f),
          ),

          hintText:  LocalizationCubit.get(context).localization ? 'الايميل ' : 'Email',//S.of(context).pageEnterEmail,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    ),
                          SizedBox(
                                height: 10,
                              ),
                              Container(
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
        controller: passoredcontroler,
        obscureText: isPassword,
        keyboardType: TextInputType.visiblePassword,

        cursorColor: Color(0xffef9b0f),
        decoration: InputDecoration(
          focusColor: Color(0xffef9b0f),
          icon: Icon(
            Icons.lock,
            color: Color(0xffef9b0f),
          ),
          hintText:  LocalizationCubit.get(context).localization ? 'كلمة المرور ' : 'Password' ,//S.of(context).pageEnterPassword,
 enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                isPassword =  !isPassword;
              });
            },
            icon: Icon(
              isPassword ? Icons.visibility_off : Icons.visibility,
              color: Color(0xffef9b0f),
            ),
          ),
        ),
        onFieldSubmitted: (value){
          print(value);
        },
        validator: (value){
          if(value!.isEmpty){
            return  LocalizationCubit.get(context).localization ? 'كلمة المرور ادخل ' : 'password must not be empty';//S.of(context).pagePasswordAddress;

          }
          return null;
        },
      ),
      // enabledBorder: InputBorder.none,
        // focusedBorder: InputBorder.none,
    ),

                            SizedBox(
                                height: 10,
                              ),
                                 Container(
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
        // controller: passoredcontroler,
        obscureText: isPassword2,
        keyboardType: TextInputType.visiblePassword,

        cursorColor: Color(0xffef9b0f),
        decoration: InputDecoration(
          focusColor: Color(0xffef9b0f),
          icon: Icon(
            Icons.lock,
            color: Color(0xffef9b0f),
          ),
          hintText:  LocalizationCubit.get(context).localization ? 'تأكيد كلمة المرور ' : 'Confirm Password',//S.of(context).pageConfirmpass,
 enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                isPassword2 =  !isPassword2;
              });
            },
            icon: Icon(
              isPassword2 ? Icons.visibility_off : Icons.visibility,
              color: Color(0xffef9b0f),
            ),
          ),
        ),
        onFieldSubmitted: (value){
          print(value);
        },
        validator: (value){
          /// اذا فاضية بترجع رسالة عبي الداتا
                                  if ((value ?? '').isEmpty) return LocalizationCubit.get(context).localization ? 'ادخل ' : 'Fill the value';//S.of(context).pageFillValue;

                                  if (value == passoredcontroler.text) return null;
                                  return LocalizationCubit.get(context).localization ? 'عدم التطابق' : 'Password and confirm password do not match';//"Password and confirm password do not match";
        },
      ),
      // enabledBorder: InputBorder.none,
        // focusedBorder: InputBorder.none,
    ),

                            SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width),
                                margin: EdgeInsets.only(left: 20, right: 20, top: 10),

                                padding: EdgeInsets.only(left: 20, right: 20),

                                alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
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

                                child: MaterialButton(
                                  onPressed: (){
                                    if (formKey.currentState!.validate()) {

                                      print("Button Clicked");
                                      this.registerModel.Name=namecontroler.text;
                                      this.registerModel.Phone= phonecontroler.text;
                                      this.registerModel.Email=emailcontroler.text;
                                      this.registerModel.Password=phonecontroler.text;
                                      BlocProvider.of<RegisterCubit>(context).SendRequest(registerModel);

                                    }
                                  },
                                  child: Text(
                                    LocalizationCubit.get(context).localization ? 'انشاء حساب' : 'Register',
                                    // S.of(context).pageRegister,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          );

                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }

  /// هاد التابع يلي بخلي الحواف مدورة
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
}