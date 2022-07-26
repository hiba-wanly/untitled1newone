import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:untitled1newone/expanded/expandedwidget.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_bloc.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_event.dart';
import 'package:untitled1newone/main_screen/bloc_main/main_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:untitled1newone/offers/offer.dart';
import 'package:untitled1newone/reviewmodle.dart';
import 'package:untitled1newone/stars/star.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../login/presentation/hello.dart';
import '../models/components/tour.dart';
import '../server/authintacation.dart';
import '../server/database_client.dart';

class Tours extends StatefulWidget {
  final Tour tour;

  const Tours(this.tour, {Key? key}) : super(key: key);

  @override
  State<Tours> createState() => _ToursState();
}

class _ToursState extends State<Tours> {
  List<String> imageList = [
    'images/malaysia1.jpg',
    'images/malaysia2.jpg',
    'images/malaysia6.jpg',
    'images/malaysia7.jpg',
    'images/malaysia8.jpg',
    'images/malaysia9.jpg',
    'images/malaysia10.jpg',
    'images/malaysia11.jpg',
    'images/malaysia12.jpg',
  ];

  List<String> buttons = [
    'Detail',
    'reviews',
    'rate now',
  ];

  bool fav = false;
  int selectedindex = 0;
  double rating = 0;
  int currentIndex = 0;
  bool isloved = false;
  int lovecount = 0;
  final items = ['report'];

  void customLaunch(command) async {
    if (await canLaunchUrlString(command)) {
      await launchUrlString(command);
    } else {
      debugPrint('could not launch $command');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.favorite),
        //     onPressed: (){
        //       fav=true;
        //     },
        //   ),
        // ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CarouselSlider(),
            SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.tour.name,
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconTheme(
                                    data: IconThemeData(
                                      color: Colors.amber,
                                      size: 30,
                                    ),
                                    child: StarDisplay(value: 3),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                LikeButton(
                                  likeCount: widget.tour.favorite.length,
                                  isLiked: widget.tour.favorite
                                      .contains(Authentication.user!.uid),
                                  onTap: (bool? tapped) async {
                                    if (Authentication.user == null) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (c) => myLogin()));
                                      return false;
                                    } else {
                                      try {
                                        bool isFavorite = widget.tour.favorite
                                            .contains(Authentication.user!.uid);
                                        List<String> ind =
                                            widget.tour.favorite.toList();
                                        if (isFavorite) {
                                          setState(() {
                                            widget.tour.favorite.removeWhere(
                                                (element) =>
                                                    element ==
                                                    Authentication.user!.uid);
                                          });
                                          debugPrint(
                                              "decrement tours favorite");

                                          await DataBaseClintServer
                                              .decrementToursFavorite(
                                                  userId:
                                                      Authentication.user!.uid,
                                                  toursId: widget.tour.id,
                                                  index: ind
                                                      .indexOf(Authentication
                                                          .user!.uid)
                                                      .toString());
                                          debugPrint(
                                              "decrement tours favorite completed");
                                          return false;
                                        } else {
                                          debugPrint(
                                              "increment tours favorite");
                                          Set<String> oldFavorite =
                                              widget.tour.favorite;
                                          setState(() => widget.tour.favorite
                                              .add(Authentication.user!.uid));
                                          await DataBaseClintServer
                                              .incrementToursFavorite(
                                                  userId:
                                                      Authentication.user!.uid,
                                                  toursId: widget.tour.id,
                                                  oldFavorite: oldFavorite);
                                          debugPrint(
                                              "increment tours favorite completed");
                                          return true;
                                        }
                                      } on Exception catch (e) {
                                        bool isFavorite = widget.tour.favorite
                                            .contains(Authentication.user!.uid);
                                        if (isFavorite) {
                                          widget.tour.favorite
                                              .add(Authentication.user!.uid);
                                        } else {
                                          widget.tour.favorite.removeWhere(
                                              (element) =>
                                                  element ==
                                                  Authentication.user?.uid);
                                        }
                                        print(e);
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "some error happened")));
                                      }
                                    }
                                    return tapped;
                                  },
                                  // likeCount:lovecount,

                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite_outline,
                                      color: isLiked
                                          ? Colors.deepOrange
                                          : Colors.grey[700],
                                      size: 35.0,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.orangeAccent,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    "Brasillia",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            //color: Colors.black,
                            height: 40,
                            //(MediaQuery.of(context).size.height)-800,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  buildContainer1(context, 0),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  buildContainer2(context, 1),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  buildContainer3(context, 2),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            // ListView.builder(
                            //     physics: BouncingScrollPhysics(),
                            //     scrollDirection: Axis.horizontal,
                            //     itemCount:buttons.length ,
                            //     itemBuilder: (context,index){
                            //       return _buildlist(context, index);

                            //     }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              selectedindex == 0
                                  ? detail()
                                  : selectedindex == 1
                                      ? reviews()
                                      : Rate(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _CarouselSlider() {
    return CarouselSlider(
      items: imageList
          .map((e) => ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(e, width: double.infinity, fit: BoxFit.cover),
                  ],
                ),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 4),
        autoPlay: true,
        enableInfiniteScroll: true,
        height: (MediaQuery.of(context).size.height) - 480,
      ),
    );
  }

  ///list of buttons
  Widget _buildlist(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: size.height * 0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          width: size.width * 0.4,
          decoration: BoxDecoration(
              color: selectedindex == index ? Colors.pink : Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.pink)),
          child: Center(
            child: Text(
              buttons[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: selectedindex == index ? Colors.white : Colors.pink,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildlist(BuildContext context,int index){
  //   Size size=MediaQuery.of(context).size;
  //   return GestureDetector(
  //     onTap: (){
  //       setState(() {
  //         selectedindex=index;
  //       });
  //
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.only(right: 10),
  //       child: Container(
  //
  //         width: size.width*0.25,
  //         decoration: BoxDecoration(
  //           color:selectedindex==index?Colors.orange: Colors.grey[600],
  //           borderRadius: BorderRadius.circular(20),
  //
  //         ),
  //         child: Center(
  //           child: Text(
  //             buttons[index],
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //                 color: selectedindex==index? Colors.white:Colors.white
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  //
  // }

  Widget detail() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Align(
                  alignment: LocalizationCubit.get(context).localization
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        '8 ',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        LocalizationCubit.get(context).localization
                            ? 'الليالي'
                            : 'Nights',
                        // S.of(context).pageNight,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                        '9',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        LocalizationCubit.get(context).localization
                            ? 'عدد الايام '
                            : 'Days',
                        // S.of(context).pageDay,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        ' 20/5/2023',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocalizationCubit.get(context).localization
                              ? 'السعر '
                              : 'price',
                          // S.of(context).pagePrice,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '125 D',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          LocalizationCubit.get(context).localization
                              ? 'الاعجابات'
                              : 'Likes',
                          // S.of(context).pageLike,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '45K',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          LocalizationCubit.get(context).localization
                              ? 'الاماكن المتاحة'
                              : 'places',
                          // S.of(context).pagePlaces,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '43',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Align(
                    alignment: LocalizationCubit.get(context).localization
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Text(
                      LocalizationCubit.get(context).localization
                          ? 'برنامج الرحلة '
                          : 'program',
                      // S.of(context).pageProgram,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: LocalizationCubit.get(context).localization
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: ExpandedWidget(
                        text:
                            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaa',
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(height: 15,),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Align(
                    alignment: LocalizationCubit.get(context).localization
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Text(
                      LocalizationCubit.get(context).localization
                          ? ' رحلتنا تضمن'
                          : 'our program include',
                      // S.of(context).pageOurProgram,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: LocalizationCubit.get(context).localization
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: ExpandedWidget(
                        text:
                            'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaaAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaasAAAaaa',
                        //style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: LocalizationCubit.get(context).localization
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  LocalizationCubit.get(context).localization
                      ? 'تواصل معنا'
                      : 'contact us',
                  // S.of(context).pageContactus,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.call,
                          size: 25,
                          color: Theme.of(context).bottomAppBarColor,
                        ),
                        onPressed: () {
                          customLaunch('tel:+5465564');
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '023156974',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.sms,
                          size: 25,
                          color: Theme.of(context).bottomAppBarColor,
                        ),
                        onPressed: () {
                          customLaunch('sms:45455');
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '023156974',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 50, //(MediaQuery.of(context).size.height)-780,
                  child: Center(
                    child: Text(
                      LocalizationCubit.get(context).localization
                          ? 'احجز الان'
                          : 'Book now',
                      // S.of(context).pageBookNow,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.pink,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 40, //(MediaQuery.of(context).size.height)-750,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey[300],
                  ),
                  //color: Theme.of(context).cardColor,
                  child: MaterialButton(
                    child: Text(
                      LocalizationCubit.get(context).localization
                          ? 'كاش'
                          : 'by bank',
                      // S.of(context).pageByBank,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 40, //(MediaQuery.of(context).size.height)-750,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.grey[300],
                  ),
                  //color: Theme.of(context).cardColor,
                  child: MaterialButton(
                    child: Text(
                      LocalizationCubit.get(context).localization
                          ? 'عند الوصول'
                          : 'when we arrive',
                      // S.of(context).pageWhenArrived,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget reviews() {
    bool isless = false;
    bool isMore = false;
    var select = 'bmw';
    List<String> itemss = ['report'];
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
                    SizedBox(
                      height: 8,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "4.5",
                            style: TextStyle(
                              fontSize: 48.0,
                              color: Colors.indigo,
                            ),
                          ),
                          TextSpan(
                            text: "/5",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Color(0xffffdd9a),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    //عرض التقييم عن طريق النجمات
                    StarDisplay(
                      value: 4,
                    ),

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
                SizedBox(
                  width: 20,
                ),
                //عرض نسبة التقييمات لكل عدد من النجمات لحالها

                Container(
                  height: 120,
                  width: 200,
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
                return Container(
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
                            children: [
                              Text(
                                reviewList[index].name,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                reviewList[index].date,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: DropdownButton(
                                items: itemss
                                    .map((e) => DropdownMenuItem(
                                          child: Text("$e"),
                                          value: e,
                                        ))
                                    .toList(),
                                onChanged: (val) {},
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
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            reviewList[index].comment,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                          )),
                      Divider(
                        thickness: 3,
                        color: Colors.grey[200],
                        indent: 20,
                        endIndent: 20,
                      )
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
  Widget Rate() {
    return Center(
      child: Column(
        children: [
          ratingg(),
          SizedBox(
            height: 20,
          ),
          EnterComment(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget ratingg() {
    //double rating=0;
    return Center(
        child: Row(
      children: [
        RatingBar.builder(
          maxRating: 1,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
            size: 10,
          ),
          onRatingUpdate: (rating) => setState(() {
            this.rating = rating;
          }),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          LocalizationCubit.get(context).localization
              ? 'التقييم'
              : 'Rating', //S.of(context).pageRating,
          style: TextStyle(fontSize: 15),
        ),
      ],
    ));
  }

  Widget EnterComment() {
    return Row(
      children: [
        Container(
          // alignment: Alignment.center,
          //margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20),
          height: 54,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusColor: Color(0xffF5591F),

              hintText: LocalizationCubit.get(context).localization
                  ? 'اكتب التعليق'
                  : 'Enter Comment', //S.of(context).pageEnterComment,
            ),
            onFieldSubmitted: (val) {
              print(val);
            },
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white38,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Colors.white70),
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.comment_outlined,
              color: Colors.lightBlueAccent,
            ),
          ),
        ),
      ],
    );
  }

  ///end
  ///list of buttons
  Widget buildContainer1(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Container(
              height: size.height * 0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  color: selectedindex == index ? Colors.pink : Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffe91e63))),
              child: Center(
                child: Text(
                  LocalizationCubit.get(context).localization
                      ? 'التفاصيل'
                      : 'details',
                  // S.of(context).pageDetail,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: selectedindex == index ? Colors.white : Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer2(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Container(
              height: size.height * 0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  color: selectedindex == index ? Colors.pink : Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffe91e63))),
              child: Center(
                child: Text(
                  LocalizationCubit.get(context).localization
                      ? ' الاراء'
                      : 'reviews',
                  // S.of(context).pageReviews,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: selectedindex == index ? Colors.white : Colors.pink,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer3(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Container(
              height: size.height * 0.4,
//padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  color: selectedindex == index ? Colors.pink : Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffe91e63))),
              child: Center(
                child: Text(
                  LocalizationCubit.get(context).localization
                      ? 'قيم الان'
                      : 'rate now',
                  // S.of(context).pageRateNow,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: selectedindex == index ? Colors.white : Colors.pink,
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
