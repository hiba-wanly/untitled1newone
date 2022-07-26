import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// import 'package:untitled1newone/CurrencyExchange/BusinessLogic(Bloc)/Currency_Cubit.dart';
// import 'package:untitled1newone/CurrencyExchange/BusinessLogic(Bloc)/Currency_States.dart';
// import 'package:untitled1newone/CurrencyExchange/CurrencyExchange(API).dart';
// import 'package:untitled1newone/color.dart';
// import 'package:untitled1newone/mytrip/MyTrip.dart';
// import 'package:untitled1newone/mytrip/mytripp/presentation/Widgets.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_bloc/currrency_cubit.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_bloc/currency_states.dart';
import 'package:untitled1newone/currencyexchange/currencyexchange_api.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/theme/colors/color.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';
import 'package:untitled1newone/mytrip/mytripp/presentation/Widgets.dart';



class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  State<CurrencyExchange> createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  var AmountController = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  Country? Choice; // to save the choice of the "From"  DropDownButton
  Country? Helper; // to help swap the values of "From" and "To" DropDownButtons
  Country? Choice2;
  double Result = 0.0;
  double Amount = 0;

  List<Country> Currencies = [];

  @override
  void initState() {
    BlocProvider.of<CurrencyCubit>(context).getCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: BlocConsumer<CurrencyCubit, CurrencyStates>(
        listener: ((context, state) {
          if (state is CurrenciesLoaded) {
            this.Currencies = state.Currencies;
            print(this.Currencies);
          }
        }),
        builder: (context, state) {
          return SafeArea(
            child: Container(decoration: BoxDecoration(gradient:
            LinearGradient(colors: [
              Colors.lightBlueAccent,
              Colors.lightBlueAccent,
              Colors.lightBlue,
              Colors.lightBlue,
              Colors.blue,
              Colors.lightBlue,
              Colors.lightBlue,
              Colors.lightBlueAccent,
              Colors.lightBlueAccent

            ] ,
                begin: Alignment.topRight,end: Alignment.bottomLeft)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            width:   MediaQuery.of(context).size.width,
                            child:
                                Text(
                                  LocalizationCubit.get(context).localization ? 'تغيير العملة 💰' : 'Currency Converter💰',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold)),
                                
                                
                            
                          ),
                        ),
                        Form(
                          key: FormKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: AmountController,
                                    decoration: InputDecoration(
                                        labelText: LocalizationCubit.get(context).localization ? ' ادخل عدد العملات  ' : 'Input Amount To Convert',
                                        filled: true,
                                        fillColor: Colors.white,
                                        labelStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.lightBlueAccent)),
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                    onFieldSubmitted: (value) {
                                      print(value);
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return LocalizationCubit.get(context).localization ? 'يجب ادخال العدد' : 'The Amount Must Be Entered';
                                      }

                                      Amount = double.parse(value);
                                      print(Amount.toString());
                                      return null;
                                    }),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color:
                                          Color.fromRGBO(255, 255, 255, 1),
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      width: 150,
                                      height: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10),
                                        child:
                                        DropdownButtonFormField2<Country>(
                                          isExpanded: true,
                                          isDense: false,
                                          decoration: InputDecoration.collapsed(
                                            hintText: LocalizationCubit.get(context).localization ? 'من' : 'From',
                                            hintStyle: TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          iconSize: 0,
                                          dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.white),
                                          value: Choice,
                                          onChanged: (value) {
                                            setState(() {
                                              Choice = value;
                                            });
                                          },
                                          items: Currencies.map((item) =>
                                              DropdownMenuItem<Country>(
                                                  value: item,
                                                  child:
                                                  CountryWidget(item)))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null)
                                              return LocalizationCubit.get(context).localization ? 'ادخال' : 'Please Select A Currency';
                                            else
                                              return null;
                                          },
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 45,
                                          width: 45,
                                          child: FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                Helper = Choice;
                                                Choice = Choice2;
                                                Choice2 = Helper;
                                              });
                                            },
                                            backgroundColor: Colors.amber,
                                            child: Icon(
                                              Icons.swap_horiz,
                                              color: Colors.white,
                                            ),
                                            foregroundColor: Colors.black45,
                                          )),
                                    ), // divider with swap values
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(5)),
                                      width: 130,
                                      height: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10),
                                        child:
                                        DropdownButtonFormField2<Country>(
                                          isExpanded: true,
                                          isDense: false,
                                          decoration: InputDecoration.collapsed(
                                              hintText:  LocalizationCubit.get(context).localization ? 'الى' : 'To',
                                              hintStyle: TextStyle(
                                                  fontWeight: FontWeight.w400)),
                                          iconSize: 5,
                                          dropdownDecoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.white),
                                          value: Choice2,
                                          onChanged: (value) {
                                            setState(() {
                                              Choice2 = value;
                                            });
                                          },
                                          items: Currencies.map((item) =>
                                              DropdownMenuItem<Country>(
                                                  value: item,
                                                  child:
                                                  CountryWidget(item)))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null)
                                              return LocalizationCubit.get(context).localization ? 'ادخال' : 'Please Select A Currency';
                                            else
                                              return null;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Text(LocalizationCubit.get(context).localization ? 'النتيجة' : 'Result',
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontSize: 18,fontWeight: FontWeight.w600)),
                                    ),
                                    state is RateLoaded
                                        ? Text((state.Rate * Amount).toString(),
                                        style: TextStyle(
                                            color: LightColors.bb,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800))
                                        :  state is WaitingResponse? Center(child: CircularProgressIndicator.adaptive()):
                                    Text(LocalizationCubit.get(context).localization ? 'النتيجة هنا' : 'Result Will Be Shown Here',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal))
                                  ]),
                                ),
                                SizedBox(height: 20),
                                InkWell(
                                  onTap: () {
                                    if (FormKey.currentState!.validate())
                                      BlocProvider.of<CurrencyCubit>(context).getRate(Choice!.Name, Choice2!.Name);

                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Center(
                                        child: Text(
                                          LocalizationCubit.get(context).localization ? ' تحويل' : 'Convert',
                                          // "Convert",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 26),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
