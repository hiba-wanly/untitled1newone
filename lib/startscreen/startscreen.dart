import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled1newone/airlines/airr.dart';
import 'package:untitled1newone/cars/listofcars.dart';
import 'package:untitled1newone/places/bloc/places_cubit.dart';
import 'package:untitled1newone/places/bloc/places_states.dart';
import 'package:untitled1newone/places/datalayer/places_model.dart';
import 'package:untitled1newone/places/places_page.dart';

// import 'package:untitled1newone/Registerall/Business%20Logic/States_Register.dart';
// import 'package:untitled1newone/StartScreen/Business%20Logic(bloc)/StartScreen_Bloc.dart';
// import 'package:untitled1newone/StartScreen/Business%20Logic(bloc)/StartScreen_States.dart';
// import 'package:untitled1newone/StartScreen/Data%20Layer/DataModel.dart';
// import 'package:untitled1newone/StartScreen/Data%20Layer/StartScreen(Api).dart';
//
// import 'package:untitled1newone/animation/animateroute.dart';
// import 'package:untitled1newone/expanded/expandedfour.dart';
// import 'package:untitled1newone/mytrip/MyTrip.dart';
// import 'package:untitled1newone/mytrip/mytripp/businesslogic/Cubit_MyTrip.dart';
// import 'package:untitled1newone/mytrip/mytripp/presentation/Widgets.dart';
// import 'package:untitled1newone/offers/offer.dart';
import 'package:untitled1newone/register/bloc/States_Register.dart';
import 'package:untitled1newone/restaurant/restaurant-page.dart';
import 'package:untitled1newone/startscreen/business_logic/startscreen_bloc.dart';
import 'package:untitled1newone/startscreen/business_logic/startscreen_states.dart';
import 'package:untitled1newone/startscreen/data_layer/datamodel.dart';
import 'package:untitled1newone/startscreen/data_layer/startscreenapi.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/expanded/expandedfour.dart';
import 'package:untitled1newone/mytrip/MyTrip.dart';
import 'package:untitled1newone/mytrip/mytripp/businesslogic/Cubit_MyTrip.dart';
import 'package:untitled1newone/mytrip/mytripp/presentation/Widgets.dart';
import 'package:untitled1newone/offers/offer.dart';
import 'package:untitled1newone/models/components/offers.dart' as h;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<DataModel> imagelist = [
    // 'images/malaysia1.jpg',
    // 'images/malaysia2.jpg',
    // 'images/malaysia6.jpg',
    // 'images/malaysia7.jpg',
    // 'images/malaysia8.jpg',
    // 'images/malaysia9.jpg',
  ];

  List<AddPlacesModel> placesm = [];

  StartApi sss = StartApi();

  List<Option> buttons = [
    Option('Hotels', Icons.home),
    Option('Flight Companies', Icons.flight_rounded),
    Option('Restaurants', Icons.restaurant_menu_rounded),
    Option('Transportations', Icons.local_taxi),
    Option('Landmarks', Icons.landscape)
  ];

  // List<Option> buttons = [
  //   Option(LocalizationCubit.get(context).localization ? 'فنادق' : 'Hotels'/*,'Hotels'*/, Icons.home),
  //   Option(LocalizationCubit.get(context).localization ? 'طيران' : 'Flight Companies',/*'Flight Companies', */Icons.flight_rounded),
  //   Option(LocalizationCubit.get(context).localization ? 'مطاعم' : 'Restaurants',/*'Restaurants',*/ Icons.restaurant_menu_rounded),
  //   Option(LocalizationCubit.get(context).localization ? 'وسائل نقل' : 'Transportations',/*'Transportations', */Icons.local_taxi),
  //   Option(LocalizationCubit.get(context).localization ? 'الاماكن' : 'Landmarks',/*'Landmarks', */Icons.landscape)
  // ];

  @override
  void initState() {
    BlocProvider.of<TripCubit>(context).getImages("Hotels", 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:
                  BlocBuilder<TripCubit, TripStates>(builder: (context, state) {
                return _CarouselSlider();
              }),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 30,
            )),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                // height:  (MediaQuery.of(context).size.height)-800,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      return _buildlist(context, index);
                    }),
              ),
            ),
            BlocBuilder<TripCubit, TripStates>(builder: (context, state) {
              if (state is ImagesLoaded) {
                this.imagelist = state.Imagelist;
                return SliverToBoxAdapter(child: PlacesList());
              }
              if (state is PlacesLoadedS) {
                this.imagelist = state.placelist;
                return SliverToBoxAdapter(child: PlacesList());
              } else
                return SliverToBoxAdapter(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(top: 50, left: 185, right: 185),
                  child: CircularProgressIndicator(color: Colors.pink),
                ));
            }),
          ],
        ),
      ),
    );
  }

  Widget _CarouselSlider() {
    return CarouselSlider(
      items: imagelist
          .map(
            (e) => ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(45),
                  bottomLeft: Radius.circular(45),
                ),
                child: InteractiveViewer(
                  maxScale: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(e.image.toString()),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22),
                            bottomRight: Radius.circular(22))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    const Color((0x00000000)),
                                    const Color((0xCC000000)).withOpacity(0.3),
                                    const Color((0xCC000000)).withOpacity(0.5),
                                    const Color((0xCC000000)).withOpacity(0.7),
                                    const Color((0xCC000000)).withOpacity(0.9),
                                    const Color((0xCC000000))
                                  ]),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(22),
                                  bottomRight: Radius.circular(22))),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0,
                                      left: 16,
                                      right: 16,
                                      bottom: 3),
                                  child: Text(e.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.w800)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 8, left: 16),
                                  child: Text("Subtitile Here",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 4),
        autoPlay: true,
        enableInfiniteScroll: true,
        height: (MediaQuery.of(context).size.height) - 500,
      ),
    );
  }

  Widget _buildlist(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TripCubit, TripStates>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          if (buttons[index].Name == "Landmarks") {
            // BlocProvider.of<TripCubit>(context).Choice2;
            BlocProvider.of<TripCubit>(context)
                .GetPlacesRequest('Cairo', index);
          } else {
            BlocProvider.of<TripCubit>(context)
                .getImages(buttons[index].Name, index);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
                color:
                    BlocProvider.of<TripCubit>(context).selectedindex == index
                        ? Colors.pink
                        : Colors.white70,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12, width: 2)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Icon(buttons[index].icon,
                      color:
                          BlocProvider.of<TripCubit>(context).selectedindex ==
                                  index
                              ? Colors.white
                              : Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    buttons[index].Name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:
                          BlocProvider.of<TripCubit>(context).selectedindex ==
                                  index
                              ? Colors.white
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget PlacesList() {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 16, right: 16),
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        crossAxisCount: 2,
        itemCount: imagelist.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.of(context).push(SlideRight(
              Page: imagelist[index].type == 'Hotels'
                  ? Hotel(h.Offer(
                      id: '',
                      description: '',
                      name: '',
                      totalCost: 12,
                      offerPath: '',
                      images: [],
                      discount: 12,
                      dateTo: DateTime.now(),
                      dateFrom: DateTime.now(),
                      companyType: 'co',
                      companyID: '',
                      favorite: false))
                  : imagelist[index].type == 'Flight Companies'
                      ? Flight()
                      : imagelist[index].type == 'Restaurants'
                          ? RestaurantScreen()
                          : imagelist[index].type == 'Transportations'
                              ? ListCars()
                              : BlocProvider(
                                  create: (BuildContext context) =>
                                      PlacesCubit(PlacesInitState()),
                                  child: PlacesScreen(
                                    placemodel: index,
                                    city: "Cairo",
                                  )), //placesm[index]
              // : RestaurantScreen()
            ));
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imagelist[index].image),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: Stack(
              children: [
                Positioned(
                    top: 20,
                    left: 16,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white70.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.black,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3, top: 8, right: 8, bottom: 8),
                            child: Text(
                              (imagelist[index].rating),
                              style: TextStyle(fontWeight: FontWeight.w600),
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
                                const Color((0xCC000000)),
                                const Color((0xCC000000)),
                                const Color((0xCC000000)),
                                const Color((0xCC000000)),
                                const Color((0xCC000000))
                              ]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22),
                              bottomRight: Radius.circular(22))),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16, right: 16, bottom: 3),
                                child: SizedBox(
                                  width: 130,
                                  child: Text(imagelist[index].name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, left: 16),
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
        staggeredTileBuilder: (index) =>
            StaggeredTile.count(1, index.isEven ? 1.5 : 1.0),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
    );
  }
}

class Option {
  final String Name;
  final IconData icon;

  Option(this.Name, this.icon);
}
