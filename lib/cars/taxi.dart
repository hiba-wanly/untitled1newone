import 'package:flutter/material.dart';
import 'package:untitled1newone/animation/animatedcar.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/cars/listofcars.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
class Taxi extends StatefulWidget {
  const Taxi({Key? key}) : super(key: key);

  @override
  _TaxiState createState() => _TaxiState();
}

class _TaxiState extends State<Taxi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 120,left: 20,right: 20,bottom: 20),
        child: Column(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width),
              height: (MediaQuery.of(context).size.height)-300,
              //color: Colors.orange,
              child: animatedimage(),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                width: (MediaQuery.of(context).size.width)-150,
                height: (MediaQuery.of(context).size.height)-740,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: MaterialButton(
                  child: Text(
                    // S.of(context).pageGetStarted,
                    LocalizationCubit.get(context).localization ? 'لنبدأ  ' : 'GET STARTED',
                    //style: Theme.of(context).textTheme.headline6,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color:Colors.black,
                    ),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(SlideLeft(Page: ListCars()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
