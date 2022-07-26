// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:untitled1newone/expandedwidget.dart';
//
// class Offers extends StatefulWidget {
//   @override
//   State<Offers> createState() => _OffersState();
// }
//
// class _OffersState extends State<Offers> {
//   int selectedindex=0;
//   // const hotel({Key? key}) : super(key: key);
//   final List<String> imageList = [
//     'images/malaysia1.jpg',
//     'images/malaysia2.jpg',
//     'images/malaysia6.jpg',
//
//   ];
//
//   List<String>buttons=[
//     'Detail',
//     'reviews'
//   ];
//
//   bool fav=false;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.favorite),
//             onPressed: (){
//               fav=true;
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//
//                 _CarouselSlider(),
//
//                // SizedBox(height: 15,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:EdgeInsets.only(left: 20,top: 20) ,
//
//                       // bottom: 20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           Padding(
//                             padding: const EdgeInsets.only(left: 10.0),
//                             child: Text(
//                               "Rotana",
//                               style: Theme.of(context).textTheme.headline1,
//                             ),
//                           ),
//
//                           SizedBox(height: 12,),
//                           Row(children: [
//                             Icon(
//                               Icons.location_pin,
//                               color: Colors.orangeAccent,size: 20,
//                             ),
//                             SizedBox(width: 12,),
//                             Text(
//                               "Amman",
//                               style: Theme.of(context).textTheme.headline6,
//                             ),
//                             SizedBox(width: 20,),
//
//                           ],),
//
//                         ],
//                       ),
//                     ),
//
//                     Container(
//                       padding: EdgeInsets.only(left:88),
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
//                       child: MaterialButton(
//
//                           onPressed: () {  },
//                           child: Row(
//                             children: [ Icon(
//                               Icons.star,
//                               color: Colors.amber,size: 20,
//                             ),
//                               SizedBox(width: 3,),
//                               Text('4.5'),
//                             ],
//                           ),
//
//                       ),
//                     ),
//
//                   ],
//                 ),
//                 SizedBox(height: 15,),
//                 Container(
//                   padding: EdgeInsets.only(left: 10),
//                   //color: Colors.black,
//                   height: 27,
//                   child: ListView.builder(
//                       physics: BouncingScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       itemCount:buttons.length ,
//                       itemBuilder: (context,index){
//                         return _buildlist(context, index);
//
//                       }),
//
//                 ),
//                 SizedBox(height: 16,),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: Detail(),
//                 )
//               ],
//             ),
//           ),
//         ),
//
//
//
//     );
//   }
//
//   Widget Detail(){
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 8.0),
//         child: Column(
//
//           children: [
//             ExpandedWidget(text:
//             'Amman Rotana is located in the central business, social and residential destination, Amman’s new downtown, Al Abdali. This 5 star hotel offers business travellers and holiday makers alike the serenity and warmth of home as well as the splendour and modern extravagance that can only be offered at Amman Rotana. The hotel is within a 45-minute drive from Queen Alia International Airport.mman Rotana is the first tower hotel in Jordan offering 412 luxury hotel rooms and suites, housed across 50 floors at 188 metres high. All rooms boast floor-to-ceiling windows offering remarkable views of the city and are flooded with natural light.',
//             ),
//             SizedBox(height: 14,),
//             Padding(
//               padding: const EdgeInsets.only(right: 260),
//               child: Text(
//                   "FACILITIES",
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//             ),
//             SizedBox(height: 9,),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   SizedBox(width: 17,),
//                   Column(
//                     children: [
//
//                       CircleAvatar(
//
//                         backgroundColor: Colors.white,
//                         backgroundImage:AssetImage(
//                           'images/malaysia1.jpg',
//                         ),
//                        radius: 35,
//
//                       ),
//                       Text(
//                         'Wifi',
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 17,),
//                   Column(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         backgroundImage:AssetImage('images/malaysia1.jpg',),
//                         radius:35,
//
//                       ),
//                       Text('outdoor pool',style: Theme.of(context).textTheme.headline4,)
//                     ],
//                   ),
//                   SizedBox(width: 17,),
//                   Column(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         backgroundImage:AssetImage('images/malaysia1.jpg',),
//                         radius:35,
//
//                       ),
//                       Text('Free breakfast',style: Theme.of(context).textTheme.headline4,)
//                     ],
//                   ),
//                   SizedBox(width: 17,),
//                   Column(
//                     children: [
//
//                       CircleAvatar(
//                         backgroundColor: Colors.white,
//                         backgroundImage:AssetImage('images/malaysia1.jpg',),
//                         radius:35,
//
//                       ),
//                       Text('Wifi',style: Theme.of(context).textTheme.headline4,)
//                     ],
//                   ),
//
//                 ],
//               ),
//             ),
//             SizedBox(height: 9,),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildlist(BuildContext context,int index){
//     Size size=MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           selectedindex=index;
//         });
//
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child: Container(
//           //  height: 20,
// //padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
//           width: size.width*0.25,
//           decoration: BoxDecoration(
//             color:selectedindex==index?Colors.orange: Colors.grey[600],
//             borderRadius: BorderRadius.circular(20),
//
//           ),
//           child: Center(
//             child: Text(
//               buttons[index],
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: selectedindex==index? Colors.white:Colors.white
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
//
//   Widget _CarouselSlider() {
//     return CarouselSlider(items: imageList.map((e) =>
//         ClipRRect(
//           // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),)
//
//           borderRadius: BorderRadius.only(bottomRight: Radius.circular(45),bottomLeft: Radius.circular(45),),
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               Image.asset(e, width: double.infinity,fit: BoxFit.cover),
//
//             ],
//           ),
//         )).toList(),
//       options: CarouselOptions(
//         viewportFraction: 1,
//         autoPlayInterval: Duration(seconds: 4),
//         autoPlay: true,
//         enableInfiniteScroll: true,
//
//         height:  (MediaQuery.of(context).size.height)-480,
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:untitled1newone/maps.dart';
import 'package:untitled1newone/reviewmodle.dart';
import 'package:untitled1newone/stars/star.dart';
import 'package:untitled1newone/theme/colors/color.dart';
import 'package:untitled1newone/models/components/offers.dart' as offer_model;

import '../expanded/expandedwidget.dart';


class Hotel extends StatefulWidget {



  final offer_model.Offer offer;
  const Hotel(this.offer,{Key? key}):super(key: key);
  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  int selectedindex=0;
  double rating=0;
  // const hotel({Key? key}) : super(key: key);
  final List<String> imageList = [
    'images/Hib.jpg',
    'images/Hib.jpg',
    'images/Hib.jpg',

  ];
  int currentIndex=0;
  bool isloved = false;
  int lovecount=0;

  List<String>buttons=[
    'Detail',
    'reviews',
    'rate now'
  ];

  bool fav=false;
  final items=['report'];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
//backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              // IconButton(
              //   tooltip: 'menu',
              //   icon: Icon(Icons.format_list_bulleted_rounded,color: Colors.lightBlueAccent,),
              //   onPressed: () {},
              // ),
              // SizedBox(width: 40,),

            ],
          )
        ],
      ),
      body: Container(
       // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///For image and back button and favorate button
              Container(
                child: Stack(
                  children: [
                    //decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(45),bottomRight: Radius.circular(45)),color: Colors.grey[400]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _CarouselSlider(),
                    ),
                    ///Back button

                    // Positioned(
                    //   top: 30,
                    //   left: 24,
                    //   child: IconButton(
                    //     icon: Icon(
                    //       Icons.arrow_back_ios,
                    //       color: Colors.white,
                    //       size: 20,
                    //     ),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // ),
                    ///favorite button
                    // Positioned(
                    //   top: 30,
                    //   right: 2,
                    //   child:   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: IconButton(
                    //       icon: Icon(
                    //         Icons.share,
                    //         color: Theme.of(context).iconTheme.color,
                    //         size: 20,
                    //       ),
                    //       onPressed: () {
                    //         //  await Share.share('Your travel itinerary from Safrni - Rotana Amman');
                    //
                    //       },
                    //     ),
                    //   ),
                    //   // child: IconButton(
                    //   //
                    //   //
                    //   //   icon: Icon(Icons.favorite_outline,
                    //   //     color: Colors.white70,
                    //   //     size: 20,), onPressed: () { fav=true; },
                    //   // )),
                    // )
                  ],
                ),
              ),

              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:EdgeInsets.only(right:50,top: 10,left: 8) ,

                    // bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            widget.offer.name,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),


                        //Text("From \$328/Night", style: TextStyle(color: Colors.lightBlueAccent,fontSize:18,fontWeight: FontWeight.w400,letterSpacing: 1.2),),
                        SizedBox(height: 12,),
                        Row(children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.orangeAccent,size: 20,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            widget.offer.discount.toString(),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(width: 20,),

                        ],)

                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        height: 65,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.amber[50],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xffffdd9a),width: 3)
                        ),
                        child: Center(
                          child: GestureDetector(
                              onTap: (){},
                              child:Column(
                                children: [
                                  SizedBox(height: 8,),
                                  Text(
                                    LocalizationCubit.get(context).localization ? 'الحجوزات' : 'Booking',
                                    // S.of(context).pageBooking,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight:FontWeight.bold,

                                      color: Colors.indigo,
                                    ),
                                  ),
                                  Text(
                                    widget.offer.totalCost.toString(),
                                    style: TextStyle(
                                      fontSize: 15.0,

                                      color: Colors.indigo,
                                    ),
                                  )

                                ],
                              )

                          ),
                        ),

                      ),
                      SizedBox(width: 5,),
                      LikeButton(
                        isLiked :isloved,
                        // likeCount:lovecount,

                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite_outline,
                            color: isLiked ? Colors.pink: Colors.grey[700],
                            size: 35.0,

                          );
                          onPressed: () {
                            Navigator.pop(context);
                          };
                        },

                      ),
                      //   Icon(
                      //   Icons.star,
                      //   color: Colors.orangeAccent,size: 20,
                      // ),
                      SizedBox(width: 3,),
                      // Text('4.5'),
                    ],
                  ),
                  // SizedBox(height: 20,)


                ],
              ),
              SizedBox(height: 15,),

              Container(
                padding: EdgeInsets.only(left: 10),
                //color: Colors.black,
                height:  40,//(MediaQuery.of(context).size.height)-750,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildContainer1(context, 0),
                      SizedBox(width: 10,),
                      buildContainer2(context, 1),
                      SizedBox(width: 10,),
                      buildContainer3(context, 2),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
                // ListView.builder(
                //     physics: BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     itemCount: buttons.length,
                //     itemBuilder: (context,index){
                //       return Row(children: [buildContainer(context, index)],);

                //     }),

              ),
              SizedBox(height: 1,),
              // Container(
              //   //padding: EdgeInsets.all(10),
              //   child: selectedindex==0?Detail():Reviews(),
              // ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 10,),
                    selectedindex==0?Detail(): selectedindex==1?Reviews():Rate(),
                  ],),
                ),
              ),






            ],
          ),
        ),
      ),


    );
  }
  Widget Detail(){
    return SingleChildScrollView(

      child: Column(

        children: [
          ///كلاس لاظهار باقي الكلمات اذا تعدت ال150 حرف

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ExpandedWidget(text:
           widget.offer.description),
          ),
          // SizedBox(height: 14,),
          Divider(color: Colors.grey[200],),

          Padding(
            padding: const EdgeInsets.only(right: 260),
            child: Text(
              // S.of(context).pageFacilities,
              LocalizationCubit.get(context).localization ? 'الخدمات' : 'FACILITIES',
              style: Theme.of(context).textTheme.subtitle1,),
          ),
          SizedBox(height: 9,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(width: 20,),
                  Column(
                    children: [
                      CircleAvatar(
                        //backgroundColor: Colors.white,
                        backgroundImage:AssetImage('images/wifi101-modified.png'),
                        radius:25,

                      ),
                      Text(
                        LocalizationCubit.get(context).localization ? 'انترنت' : 'Wifi',
                          // S.of(context).pageWifi,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: LightColors.green,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      CircleAvatar(
                       // backgroundColor: Colors.white,
                        backgroundImage:AssetImage('images/pool-modified.png'),
                        radius:25,

                      ),
                      Text(
                        LocalizationCubit.get(context).localization ? 'مسبح خارجي' : 'outer pool',
                        // S.of(context).pagePool,
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          color: LightColors.green,
                        ),)
                    ],
                  ),
                  SizedBox(width:20,),
                  Column(
                    children: [
                      CircleAvatar(
                       // backgroundColor: Colors.white,
                        backgroundImage:AssetImage('images/break-modified.png'),
                        radius:25,

                      ),
                      Text(
                        LocalizationCubit.get(context).localization ? 'وجبة فطور' : 'free breakfast',
                        // S.of(context).pageBreakfast,
                        style: TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: LightColors.green,
                      ),)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [

                      CircleAvatar(
                        //backgroundColor: Colors.white,
                        backgroundImage:AssetImage('images/sport-modified.png'),
                        radius:25,

                      ),
                      Text(
                        LocalizationCubit.get(context).localization ? 'رياضة' : 'sport',
                        // S.of(context).pageSport,
                        style:TextStyle(
                        letterSpacing: 0.5,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: LightColors.green,
                      ),)
                    ],
                  ),

                ],
              ),
            ),
          ),
          Divider(color: Colors.grey[200],),

          //SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                LocalizationCubit.get(context).localization ? 'الموقع' : 'LOCATION',
                // S.of(context).pageLocation,
                style: Theme.of(context).textTheme.subtitle1,
              )
          ),
          SizedBox(height: 20,),

          MaterialButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Maps(),),);
            },
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[500],
                image: new DecorationImage(image: AssetImage("images/location.jpg"),fit:BoxFit.cover,),
              ),

            ),
          ),
          Divider(color: Colors.grey[200],),
          Padding(
            padding: const EdgeInsets.only(right: 238),
            child: Text('Policies',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Column(children: [
              Text('CHECK-ON DATE: 02:00 PM',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.grey[800]),),
              SizedBox(height: 5,),

              Text('CHECK-OUT DATE: 12:00 PM',style: TextStyle(fontWeight:  FontWeight.normal,color: Colors.grey[800]),),
              SizedBox(height: 5,),

 Text('Type: Triple',style: TextStyle(fontWeight:  FontWeight.normal,color: Colors.grey[800]),),
              SizedBox(height: 5,),


            ],),
          ),







        ],
      ),
    );
  }
  Widget Reviews(){
    bool isless=false;
    bool isMore = false;
    var select='bmw';
    List<String>itemss=['report'];
    List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
    return SingleChildScrollView(

      child: Container(
        child: Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8,),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "4.5",
                            style: TextStyle(fontSize: 48.0,color:Colors.indigo,),
                          ),
                          TextSpan(
                            text: "/5",
                            style: TextStyle(
                              fontSize: 24.0,
                              color:Color(0xffffdd9a),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),
                    //عرض التقييم عن طريق النجمات
                    StarDisplay( value: 4,),

                    SizedBox(height: 16.0),
                    Text(
                      "${reviewList.length} Reviews",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20,),
                //عرض نسبة التقييمات لكل عدد من النجمات لحالها

                Container(
                  height: 120,
                  width:190,
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(width: 4.0),
                          Icon(Icons.star, color: Color(0xffffdd9a)),
                          SizedBox(width: 4.0),
                          LinearPercentIndicator(
                            lineHeight: 6.0,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            width: MediaQuery.of(context).size.width / 2.8,
                            animation: true,
                            animationDuration: 2500,
                            percent: ratings[index],
                            progressColor: Colors.indigo,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            //Text("mkjl",style: TextStyle(fontSize: 100),)

            ///reviewlist:هي ليست افتراضيى بتبعت للموديل المعلومات
            ///عرض التعليقات

            ListView.builder(
              physics: BouncingScrollPhysics(),

              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,

              padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
              itemCount: reviewList.length,
              itemBuilder: (context, index) {
                return  Container(
                  padding: EdgeInsets.only(
                    top: 2.0,
                    bottom: 2.0,
                    left: 16.0,
                    right: 0.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 45.0,
                            width: 45.0,
                            margin: EdgeInsets.only(right: 16.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(reviewList[index].image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(44.0),
                            ),
                          ),
                          Column(
                            children: [Text(
                              reviewList[index].name,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              SizedBox(height: 8,),
                              Text(
                                reviewList[index].date,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: DropdownButton(items:itemss.map((e) =>
                                  DropdownMenuItem(child:
                                  Text("$e"),
                                    value: e,
                                  )).toList(),
                                onChanged: (val){},
                                enableFeedback: false,
                                iconEnabledColor: Colors.orange,
                                iconDisabledColor: Colors.indigo,
                                elevation: 0,
                                borderRadius: BorderRadius.zero,
                              )
                            // IconButton(
                            //   onPressed:(){
                            //
                            //     setState(() {
                            //
                            //     });
                            //   },
                            //   icon: Icon(Icons.more_vert),
                            // ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.0),
                      Row(
                        children: [


                          SizedBox(width:10),

                        ],
                      ),
                      SizedBox(height: 8.0),
                      GestureDetector(
                          onTap: (){},
                          child: Text(
                            reviewList[index].comment,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          )

                      ),
                      Divider(thickness: 3,color: Colors.grey[200],indent: 20,endIndent: 20,)
                    ],
                  ),
                );

                // return ReviewUI(
                //   image: reviewList[index].image,
                //   name: reviewList[index].name,
                //   date: reviewList[index].date,
                //   comment: reviewList[index].comment,
                //   rating: reviewList[index].rating,
                //   onPressed: () => print("More Action $index"),
                //   onTap: () => setState(() {
                //     isMore = !isMore;
                //   }),
                //   isLess: isMore,
                // );
              },
              // itemBuilder: (context, index) {
              //      return Divider(
              //        thickness: 2.0,
              //        color: Colors.orangeAccent,
              //      );
              //    },
            ),

            //         Container(
            // child:SingleChildScrollView(
            //   child: Column(children: [
            //
            //   ],),
            // )
            //
            //            ),




          ],
        ),
      ),
    );
  }


  ///rate now start
  Widget Rate(){
    return Center(
      child: Column(
        children: [ratingg(),
          SizedBox(height: 20,),
          EnterComment(),
          SizedBox(height: 10,),

        ],
      ),
    );

  }
  Widget ratingg(){
    //double rating=0;
    return Center(child: Row(children: [
      RatingBar.builder(
        maxRating: 1,
        itemBuilder: (context,_)=>
            Icon(Icons.star,color: Colors.amber,size: 10,),
        onRatingUpdate: (rating)=>setState(() {
          this.rating=rating;
        }),
      ),
      SizedBox(width: 10,),
      Text(
        LocalizationCubit.get(context).localization ? 'التقييم' : 'Rating',
        // S.of(context).pageRating,
        style:TextStyle(fontSize: 15) ,
        ),


    ],)
    );
  }
  Widget EnterComment(){
    return Row(
      children: [
        Container(
          // alignment: Alignment.center,
          //margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20 ),
          height: 54,
          width: 250,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)
              ),
            ],
          ),
          child: TextFormField(

            keyboardType: TextInputType.visiblePassword,

            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusColor: Color(0xffF5591F),

              hintText: LocalizationCubit.get(context).localization ? 'اكتب تعليق' : 'Enter Comment',//S.of(context).pageEnterComment,


            ),
            onFieldSubmitted: (val){
              print(val);
            },


          ),

        ),
        SizedBox(width: 2,),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white38,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Colors.white70
              ),
            ],
          ),
          child: IconButton(onPressed: () {  },
            icon: Icon(Icons.comment_outlined,
              color: Colors.lightBlueAccent,),
          ),
        ),






      ],
    );


  }
  ///end


//   ///list of buttons
//   Widget _buildlist(BuildContext context,int index){
//     Size size=MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           selectedindex=index;
//         });

//       },
//       child: Padding(
//         padding: const EdgeInsets.only(right: 10),
//         child: Container(
//           //  height: 20,
// //padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
//           width: size.width*0.25,
//           decoration: BoxDecoration(
//               color:selectedindex==index?Colors.orange: Colors.white70,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Color(0xffffdd9a))

//           ),
//           child: Center(
//             child: Text(
//               buttons[index],
//               style: TextStyle(fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: selectedindex==index? Colors.white:Colors.orange,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//   }

  ///carousel slider
  Widget _CarouselSlider() {
    return CarouselSlider(items: imageList.map((e) =>
        ClipRRect(
          // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),)

          borderRadius: BorderRadius.only(bottomRight: Radius.circular(45),bottomLeft: Radius.circular(45),),
          child: Stack(
            fit: StackFit.expand,
            children: [
              InteractiveViewer(
                maxScale: 4,
                child:  Image.asset(e, width: double.infinity,fit: BoxFit.cover),)


            ],
          ),
        )).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 4),
        autoPlay: true,
        enableInfiniteScroll: true,

        height: (MediaQuery.of(context).size.height)-480,
      ),
    );
  }

  ///list of buttons
  Widget buildContainer1(BuildContext context,int index){
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedindex=index;
        });

      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
             Container(
           height: size.height*0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          width: size.width*0.4,
          decoration: BoxDecoration(
              color:selectedindex==index?Colors.pink: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xffe91e63))

          ),
          child: Center(
            child: Text(
              LocalizationCubit.get(context).localization ? 'التفاصيل' : 'details',
              // S.of(context).pageDetail,
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: selectedindex==index? Colors.white:Colors.pink,
              ),
            ),
          ),
        ),        
          ],
        ),
      ),
    );

  }

  Widget buildContainer2(BuildContext context,int index){
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedindex=index;
        });

      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
             Container(
           height: size.height*0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          width: size.width*0.4,
          decoration: BoxDecoration(
              color:selectedindex==index?Colors.pink: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xffe91e63))

          ),
          child: Center(
            child: Text(
              // S.of(context).pageReviews,
               LocalizationCubit.get(context).localization ? 'الاراء' : 'reviews',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: selectedindex==index? Colors.white:Colors.pink,
              ),
            ),
          ),
        ),
                
          ],
        ),
      ),
    );

  }

  Widget buildContainer3(BuildContext context,int index){
    Size size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedindex=index;
        });

      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
             Container(
           height: size.height*0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          width: size.width*0.4,
          decoration: BoxDecoration(
              color:selectedindex==index?Colors.pink: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xffe91e63))

          ),
          child: Center(
            child: Text(
              // S.of(context).pageRateNow,
               LocalizationCubit.get(context).localization ? 'قيم الان' : 'rate now',
              style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: selectedindex==index? Colors.white:Colors.pink,
              ),
            ),
          ),
        ),
                    
          ],
        ),
      ),
    );

  }



}
