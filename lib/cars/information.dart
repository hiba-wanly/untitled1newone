import 'package:flutter/material.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/cars/bookcar.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/stars/star.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class InfoCars extends StatefulWidget {
  const InfoCars({Key? key}) : super(key: key);

  @override
  _InfoCarsState createState() => _InfoCarsState();
}

class _InfoCarsState extends State<InfoCars> {
  void customLaunch(command)async{
    if(await canLaunch(command)){
      await UrlLauncher.launch(command);
    }else{
      print('could not launch $command');
    }
  }

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
      body: Column(
        children: <Widget>[
          Container(height:(MediaQuery.of(context).size.height)-400,
            padding: EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/1652625125006-modified.png"),
                //fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget> [
              // Max Size
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.grey[200],
                ),
                alignment: const Alignment (1,1),
                height: (MediaQuery.of(context).size.height)-450,
                width: (MediaQuery.of(context).size.width)-20,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20,left: 40),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Taxi',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconTheme(
                              data: IconThemeData(
                                color: Colors.amber,
                                size: 25,
                              ),
                              child: StarDisplay(value: 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,top: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_box,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            '4 ',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            S.of(context).pagePerson,
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,top: 10),
                      child: Align(
                        alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                        child: Text(
                          S.of(context).pageCost,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40,top: 8),
                      child: Align(
                        alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                        child: Container(
                          width: 80,
                          child: Row(
                            children: [
                              // Row(
                              //   children: [
                              //     Text(
                              //       '15',
                              //       style: Theme.of(context).textTheme.headline5,
                              //     ),
                              //     SizedBox(width: 10,),
                              //     Text(
                              //       'Hours ',
                              //       style: Theme.of(context).textTheme.headline4,
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(width: 25,),
                              Row(
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context).textTheme.headline5,
                                  ),
                                  SizedBox(width: 10,),
                                  Text(
                                    'Km',
                                    style: Theme.of(context).textTheme.headline4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 40),
                      child: Align(
                        alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                        child: Text(
                          S.of(context).pageContactus,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 30),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.call,
                                  size: 25,
                                  color: Theme.of(context).bottomAppBarColor,
                                ),
                                onPressed: (){
                                  customLaunch('tel:+5465564');
                                },
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '023156974',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.sms,
                                  size: 25,
                                  color: Theme.of(context).bottomAppBarColor,
                                ),
                                onPressed: (){
                                  customLaunch('sms:45455');
                                },
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '023156974',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          width: (MediaQuery.of(context).size.width)-150,
                          height: (MediaQuery.of(context).size.height)-740,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: MaterialButton(
                            child: Text(
                              S.of(context).pageBook,
                              //style: Theme.of(context).textTheme.headline6,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:Colors.black,
                              ),
                            ),
                            onPressed: (){
                              Navigator.of(context).push(Slide7(Page: BookCar()));
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                  // Stack(
                  //   children: <Widget>[
                  //     Container(
                  //       padding: EdgeInsets.only(top: 8),
                  //       height: (MediaQuery.of(context).size.height)-450,
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: AssetImage(
                  //             'images/cart11.jpg',
                  //           ),
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //     Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.only(
                  //             topRight: Radius.circular(30),topLeft: Radius.circular(30)),
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //           ),
                  //           child: Column(
                  //             children: [
                  //               SizedBox(height: 20,),
                  //               Text('aa'),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 20),
// child: Column(
// children: [
// Image(
// image: AssetImage('images/cart11.jpg'),
// width: (MediaQuery.of(context).size.width),
// height: (MediaQuery.of(context).size.height)-450,
// fit: BoxFit.cover,
// ),
// ],
// ),
// ),