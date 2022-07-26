import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/localization/localization_bloc.dart';
import 'package:untitled1newone/offers/offer.dart';
import 'package:untitled1newone/theme/colors/color.dart';
import 'package:untitled1newone/homelayout/bloc/home_bloc.dart';
import 'package:untitled1newone/homelayout/bloc/home_state.dart';
import 'package:untitled1newone/tours/tour.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  List<Offer> favor = [
    // Offer(image: 'images/play1.jpg',text: 'AAA',flag: 'plat1'),
    // Offer(image: 'images/play2.jpg',text: 'AAA',flag: 'play2'),
    // Offer(image: 'images/play3.jpg',text: 'AAA', flag: 'play3'),
    //Offer(image: 'images/rest1.jpg',text: 'AAA', flag: 'rest1'),
    Offer(image: 'images/hotel1.jpg',text: 'AAA', flag: 'hotel1'),
    Offer(image: 'images/hotel2.jpg',text: 'AAA', flag: 'hotel2'),
    Offer(image: 'images/hotel3.jpg',text: 'AAAAAAAAAAAAAAAa',flag: 'hotel3'),
    Offer(image: 'images/food1.jpg',text: 'AAA',flag:'food1'),
    Offer(image: 'images/fly1.jpg',text: 'AAA',flag: 'fly1'),
    Offer(image: 'images/fly2.jpg',text: 'AAAAAAAAAAAAAAA', flag: 'fly2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
          child: Text(
            LocalizationCubit.get(context).localization ? 'المفضلة' : 'Favorite',
            // S.of(context).pageFavorite,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  SizedBox(
            height: (MediaQuery.of(context).size.height),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 110),
              child: ListView.builder(
                itemCount: favor.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index)=>Padding(
                  padding: const EdgeInsets.only(right: 4,left: 4,bottom: 10),
                  child:  Center(
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Ink.image(
                              image: AssetImage(
                                favor[index].image,
                              ),
                              child: InkWell(
                                onTap: (){
                                  // Navigator.push(
                                  //   context ,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Hotel(),
                                  //   ),
                                  // );
                                  // Navigator.of(context).push(Slide3(Page: Hotel()));
                                  //context.read<MainScreenBloc>().add(OfferEvent());
                                },
                              ),
                              width: (MediaQuery.of(context).size.width),
                              height:  (MediaQuery.of(context).size.height)-550,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: LocalizationCubit.get(context).localization ? Alignment.topRight : Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Theme.of(context).appBarTheme.iconTheme!.color,
                              ),
                              onPressed: (){
                                // Navigator.of(context).push(SlideRight(Page: Tours()));
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: (MediaQuery.of(context).size.width),
                              height: (MediaQuery.of(context).size.height)-550,
                              color: Colors.black12,
                              padding: EdgeInsets.all(10),
                              child: MaterialButton(
                                onPressed: (){
                                  // Navigator.of(context).push(SlideRight(Page: Tours()));
                                },
                                child: Align(
                                  alignment: LocalizationCubit.get(context).localization ? Alignment.bottomRight : Alignment.bottomLeft,
                                  child: Text(
                                    favor[index].text,
                                    style:  Theme.of(context).textTheme.headline2,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // SizedBox(width: 5,),
                        ],
                      ),
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



//
// Card(
// elevation: 2,
// shadowColor: Colors.white,
// clipBehavior: Clip.antiAlias,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// ),
// child: Stack(
// children: [
// Ink.image(
// image: AssetImage(
// favor[index].image,
// ),
// child: InkWell(
// onTap: (){
// Navigator.of(context).push(SlideRight(Page: Offers()));
// //context.read<MainScreenBloc>().add(OfferEvent());
// },
// ),
// width: (MediaQuery.of(context).size.width),
// height:  (MediaQuery.of(context).size.height)-600,
// fit: BoxFit.cover,
// ),
// Positioned(
// bottom: 10,
// right: 0,
// child: Container(
// width: (MediaQuery.of(context).size.width),
// height: 40,
// // color: Colors.black54,
// padding: EdgeInsets.all(10),
// child: MaterialButton(
// onPressed: (){},
// child: Row(
// children: [
// Text(
// favor[index].text,
// style: Theme.of(context).textTheme.headline2,
// ),
// Align(
// alignment: Alignment.topLeft,
// child: IconButton(
// onPressed: () {
// },
// icon: Icon(
// Icons.favorite,
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ),
// ],
// ),
// ),