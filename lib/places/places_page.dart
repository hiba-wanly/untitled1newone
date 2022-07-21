import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:untitled1newone/places/bloc/places_cubit.dart';
import 'package:untitled1newone/places/bloc/places_states.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';
import 'package:untitled1newone/stars/star.dart';
import 'package:untitled1newone/maps.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';

class PlacesScreen extends StatefulWidget {
  // const PlacesScreen({Key? key}) : super(key: key);

  late int placemodel;
  late String city;
  // late AddPlacesModel placemodel ;
  PlacesScreen({required this.placemodel , required this.city});
  @override
  State<PlacesScreen> createState() => _PlacesScreenState(placemodel: this.placemodel, city: this.city);
}

class _PlacesScreenState extends State<PlacesScreen> {

  _PlacesScreenState({required this.placemodel, required this.city});

  List<String> imageList = [
    // 'images/place1.jpg',
    // 'images/place2.jpg',
    // 'images/place3.jpg',
    // 'images/place4.jpg',
    // 'images/place5.jpg',
    // 'images/place6.jpg',
    // 'images/place7.jpg',
    // 'images/place8.jpg',
   
  ];

  bool isloved = false;

  // late AddPlacesModel placemodel;
  late int placemodel;
  late String city;

  late AddPlacesModel placesone;

  // late List<String> imagelist2; 

  int current = 0;
  

   @override
  void initState() {
    BlocProvider.of<PlacesCubit>(context).GetOnePlaceRequest(city, placemodel);
    
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 20,
                height: 20,
               
                child: Center(
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                     color: Colors.black26,
          
                ),
              ),
            ),
          ),
          
          extendBodyBehindAppBar: true,

          body: BlocConsumer<PlacesCubit,PlacesState>(
            listener: (context, state){
              if (state is PlacesLoadingErrorState){
                     ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message))
                      );
              }

            },
            builder: (context, state) {
             //  if(state is PlacesLoading){
             //      return Center(
             //            child: CircularProgressIndicator(),
             //          );
             //  }

               if (state is PlacesLoadedState) {
                        placesone = state.place;
                        imageList = [
                          placesone.img1path,
                          placesone.img2path,
                          placesone.img3path,
                        ];
                        return PlaceList();
                        
                      }
              else return 
               Center(
                       child: CircularProgressIndicator(),
               );
           }),
    );
  }

  Widget PlaceList (){
    return  SingleChildScrollView(
      child: Column(
                   children: [
                        _CarouselSlider(),
                        // SizedBox(height: 20,),
                        Container(
                          height: (MediaQuery.of(context).size.height)-650,
                          width: (MediaQuery.of(context).size.width),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(35),
                               ),
                            elevation: 1,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20,left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        LocalizationCubit.get(context).localization ? 'اوقات الدوام:' : 'Time : ',
                                        // "Time : ",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        placesone.fromtime.toString(),
                                        // "8 AM",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        ),
                                        SizedBox(width: 3,),
                                      Text(
                                        placesone.totime.toString(),
                                        // "9 PM",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                    Row(
                                    children: [
                                      Text(
                                        LocalizationCubit.get(context).localization ? 'الايام:' : 'Days : ',
                                        // "Days : ",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      Text(
                                        placesone.fromday,
                                        // "Friday",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        "-",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        ),
                                        SizedBox(width: 3,),
                                      Text(
                                        placesone.today,
                                        // "Tuesday",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                   SizedBox(height: 10,),
                                    Row(
                                    children: [
                                    
                                      Text(
                                        LocalizationCubit.get(context).localization ? 'التكلفة:' : 'Total : ',
                                        // "Total: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 3,),
                                      Text(
                                        placesone.price.toString(),
                                        // "1500.0",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        ),
                                       
                                    ],
                                  ),
                                  
                                
                                ],
                              ),
                            ),
                            
                          ),
                        ),
                        SizedBox(height: 15,),
                          Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text(
                  LocalizationCubit.get(context).localization ? 'الموقع' : 'LOCATION',
                  // 'LOCATION',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  ),
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
                  image: new DecorationImage(image: AssetImage("images/map.jpg"),fit:BoxFit.cover,),
                ),
    
              ),
            ),
           SizedBox(height: 15,),
                        Container(
                          height: 60,
                          width: (MediaQuery.of(context).size.width)-40,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  LocalizationCubit.get(context).localization ? 'قم بزيارته' : 'Visit Now',
                                  // "Visit Now",
                                    style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500, 
                                          letterSpacing: 1,
                                           ),
                                ),
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.account_balance_outlined,
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                             color: Colors.pink,
                             borderRadius: BorderRadius.circular(20),
                             border: Border.all(color: Color(0xffffdd9a))
            
                ),
                        ),
                        SizedBox(height: 20,),
                   ],
              ),
    );
  }

  Widget _CarouselSlider() {
    return CarouselSlider(
      items: imageList.map((e) =>
        ClipRRect(

          borderRadius: BorderRadius.only(bottomRight: Radius.circular(35),bottomLeft: Radius.circular(35),),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(e, width: double.infinity,fit: BoxFit.cover),
                 Positioned(
                        bottom: 10,
                        left: 0,
                        child: Container(
                          // width: (MediaQuery.of(context).size.width)-250,
                          // height: 40,
                          
                          padding: EdgeInsets.only(left: 20,bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: (MediaQuery.of(context).size.width)-70,
                                child: Text(
                                  placesone.name,
                                  // "Enjoy the Fairy Meadows",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                     ),
                            ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: (MediaQuery.of(context).size.width)-70,
                                child: Text(
                                  placesone.description,
                                  // "Enjoy beautiful places in our Fairy Meadows and Naran",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500, 
                                     ),
                            ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                width: (MediaQuery.of(context).size.width),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                          Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.place,
                                      size: 25,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      placesone.city,
                                      // "Pakistan",
                                      style: TextStyle(
                                        color: Colors.white,

                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                IconTheme(
                                 data: IconThemeData(
                                   color: Colors.amber,
                                   size: 20,
                                 ),
                                 child: StarDisplay(value: placesone.stars),
                                    ),
                                
                                      ],
                                    ),
                                    SizedBox(width: (MediaQuery.of(context).size.width)-170,),
                                    Align(
                                  alignment: Alignment.centerRight,
                                  child:   LikeButton(
                                    isLiked :isloved,
                                    // likeCount:lovecount,

                                    likeBuilder: (bool isLiked) {
                                 return Icon(
                                   Icons.favorite_outline,
                                   color: isLiked ? Colors.pinkAccent: Colors.white,
                                   size: 35.0,

                                 );
                                 onPressed: () {
                                   Navigator.pop(context);
                                 };
                                    },

                                  ),
                                
                                ),

                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    
            ],
          ),
        )).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 4),
        autoPlay: true,
        enableInfiniteScroll: true,

        height: (MediaQuery.of(context).size.height)-250,
      ),
    );
  }
 

}