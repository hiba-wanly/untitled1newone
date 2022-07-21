
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/cars/listofcars.dart';
import 'package:untitled1newone/expanded/expandedfour.dart';
import 'package:untitled1newone/expanded/expandedthree.dart';
import 'package:untitled1newone/cars/taxi.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/theme/colors/color.dart';
import 'package:untitled1newone/drawer/drawer.dart';
import 'package:untitled1newone/homelayout/bloc/home_bloc.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_bloc.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_event.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_state.dart';
import 'package:untitled1newone/offers/offer.dart';
import 'package:untitled1newone/tours/tour.dart';


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<String> imageList = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
  ];

  List<Offer> offer = [
    Offer(
        image: 'images/play1.jpg', text: 'AAAAAAAAAAAAAAAAaAAA', flag: 'plat1'),
    Offer(image: 'images/play2.jpg', text: 'AAA', flag: 'play2'),
    Offer(image: 'images/play3.jpg', text: 'AAA', flag: 'play3'),
    //Offer(image: 'images/rest1.jpg',text: 'AAA', flag: 'rest1'),
    Offer(image: 'images/hotel1.jpg', text: 'AAA', flag: 'hotel1'),
    Offer(image: 'images/hotel2.jpg', text: 'AAA', flag: 'hotel2'),
    Offer(image: 'images/hotel3.jpg', text: 'AAA', flag: 'hotel3'),
    Offer(image: 'images/food1.jpg', text: 'AAA', flag: 'food1'),
    Offer(image: 'images/fly1.jpg', text: 'AAA', flag: 'fly1'),
    Offer(image: 'images/fly2.jpg', text: 'AAA', flag: 'fly2'),
  ];

  List<Tour> tour = [
    Tour(
        image: 'images/play1.jpg',
        name: 'AAAAAAAAAAAAAAAAAAAAAAaAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/play2.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/play3.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    // Tour(image: 'images/rest1.jpg',name: 'AAA',stars: 3,night: 5,day:4,price:154,view: 5487,place: 5,num: 012365479,num2: 45123697,description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/hotel1.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/hotel2.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/hotel3.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/food1.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/fly1.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
    Tour(
        image: 'images/fly2.jpg',
        name: 'AAA',
        stars: 3,
        night: 5,
        day: 4,
        price: 154,
        view: 5487,
        place: 5,
        num: 012365479,
        num2: 45123697,
        description: 'jfffjjfkfkdlfjlfjdfhdffhkhjfgr',
        include: 'fkjfkghfgkhfggfjhgfjhg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: LightColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // backgroundColor: LightColors.cc,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: DrawerWidget(),
          ),
          // IconButton(
          //   tooltip: 'favorite',
          //   icon: Icon(Icons.favorite),
          //   onPressed: () {},
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
          ),
          IconButton(
            tooltip: 'Search',
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCars(),
                ),
              );
            },
          ),
        ],
      ),

      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              // SizedBox(height: 15.0,),
              _CarouselSlider(),
              SizedBox(
                height: 28.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: _Offers(),
              ),
              SizedBox(
                height: 28.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: _Tour(),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _CarouselSlider() {
    return CarouselSlider(
      items: imageList
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      e,
                      width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.height) - 490,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ))
          .toList(),
      options: CarouselOptions(
        autoPlayInterval: Duration(seconds: 3),
        autoPlay: true,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        height: (MediaQuery.of(context).size.height) - 500,
      ),
    );
  }

  Widget _Offers() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
         alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,

          child: Text(
            LocalizationCubit.get(context).localization ? 'عروض' : 'OFFERS',
            // 'OFFERS',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 1,
        ),
        SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) - 600,
            child: ListView.builder(
              itemCount: offer.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(SlideRight(Page: Hotel()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(offer[index].image),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(25),),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 15,
                              left: 10,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.discount_rounded,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                         top: 8, right: 8, bottom: 8),
                                      child: Text("50%",
                                        style: TextStyle(
                                          color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ]))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          const Color((0x00000000)),
                                          const Color((0xCC000000))
                                              .withOpacity(0.6),
                                          const Color((0xCC000000))
                                              .withOpacity(0.9),
                                          const Color((0xCC000000))
                                              .withOpacity(0.9),
                                          const Color((0xCC000000))
                                        ]),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22),
                                        bottomRight: Radius.circular(22))),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0,
                                              left: 16,
                                              right: 16,
                                              bottom: 3),
                                          child: SizedBox(
                                            width: 130,
                                            child: Text(offer[index].text,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8, left: 16),
                                          child: Text("Subtitile Here",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              // itemBuilder: (context,index)=>Padding(
              //   padding: const EdgeInsets.only(right: 2,left: 2),
              //   child: Card(
              //      elevation: 2,
              //     shadowColor: Colors.white,
              //     clipBehavior: Clip.antiAlias,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Stack(

              //       alignment: Alignment.center,
              //        children: [
              //            Ink.image(
              //            image: AssetImage(
              //                offer[index].image
              //            ),
              //            child: InkWell(
              //              onTap: (){
              //                Navigator.of(context).push(SlideRight(Page: Hotel()));
              //                //context.read<MainScreenBloc>().add(OfferEvent());
              //              },
              //            ),
              //            width: (MediaQuery.of(context).size.width)-270,
              //            //height:  (MediaQuery.of(context).size.height)-640,
              //            fit: BoxFit.cover,
              //      ),
              //          Positioned(
              //            bottom: 0,
              //            right: 0,
              //            child: Container(
              //               width: (MediaQuery.of(context).size.width)-265,
              //              height: 40,
              //              color: Colors.black54,
              //              padding: EdgeInsets.all(10),
              //              child: MaterialButton(
              //                onPressed: (){
              //                  //Navigator.of(context).push(SlideRight(Page: Offers()));
              //                  // Navigator.push(
              //                  //   context ,
              //                  //   MaterialPageRoute(
              //                  //     builder: (context) => Offers(),
              //                  //   ),
              //                  // );
              //                },
              //                child: Center(
              //                    child:Expandedfour(
              //                      text: offer[index].text,
              //                    ),
              //                    // Text(
              //                    //   offer[index].text,
              //                    //   style: Theme.of(context).textTheme.headline2,
              //                    // ),
              //                ),
              //              ),
              //            ),
              //            ),
              //           ],
              //     ),
              //   ),
              // ),
              // SizedBox(width: 5,),
            ),
          ),
        ),
      ],
    );
  }

  Widget _Tour() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,

          child: Text(
            LocalizationCubit.get(context).localization ? 'رحلات' : 'TOURS',
            // ' TOURS',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: 1,
        ),
        SingleChildScrollView(
          //scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: (MediaQuery.of(context).size.height) - 475,
            child: Container(
              child: ListView.builder(
                itemCount: tour.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 2, left: 2),
                  child: Card(
                    elevation: 5,
                    color: Theme.of(context).cardColor,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          // alignment: Alignment.center,
                          children: [
                            Image(
                              image: AssetImage(tour[index].image),
                              width: (MediaQuery.of(context).size.width) - 190,
                              height:
                                  (MediaQuery.of(context).size.height) - 630,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15).copyWith(bottom: 0),
                          child: Column(
                            children: [
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) - 220,
                                child: Expandedthree(
                                  text: tour[index].name,
                                ),
                              ),

                              // Text(
                              //   tour[index].name,
                              //   style: Theme.of(context).textTheme.headline3,
                              // ),

                              SizedBox(
                                height: 7,
                              ),
                              Container(
                                width:
                                    (MediaQuery.of(context).size.width) - 220,
                                child: Row(
                                  children: [
                                    Text(
                                      ' ${tour[index].day}',
                                      style: Theme.of(context).textTheme.headline4,
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      LocalizationCubit.get(context).localization ? 'يوم' : 'Days',
                                      style: Theme.of(context).textTheme.headline4,
                                      textAlign: TextAlign.left,
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              child: Text(
                                LocalizationCubit.get(context).localization ? 'المزيد' : 'more',
                                // 'more',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(SlideLeft(Page: Tours()));
                                //context.read<MainScreenBloc>().add(ToursEvent());
                                // Navigator.push(
                                //   context ,
                                //   MaterialPageRoute(
                                //     builder: (context) => Tours(
                                //       // image: tour[index].image,
                                //       // title: tour[index].title,
                                //       // description: tour[index].description,
                                //       // price: tour[index].price,
                                //       // day: tour[index].day,
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Offer {
  String image;
  String text;
  String flag;
  Offer({
    required this.image,
    required this.text,
    required this.flag,
  });
}

class Tour {
  String image;
  String name;
  int stars;
  int night;
  int day;
  int price;
  int view;
  int place;
  int num;
  int num2;
  String description;
  String include;
  Tour({
    required this.image,
    required this.name,
    required this.stars,
    required this.night,
    required this.day,
    required this.price,
    required this.view,
    required this.place,
    required this.num,
    required this.num2,
    required this.description,
    required this.include,
  });
}
