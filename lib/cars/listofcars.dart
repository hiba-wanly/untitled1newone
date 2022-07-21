import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/cars/information.dart';
import 'package:untitled1newone/offers/offer.dart';


// class ListCars extends StatefulWidget {
//   const ListCars({Key? key}) : super(key: key);

//   @override
//   _ListCarsState createState() => _ListCarsState();
// }

// class _ListCarsState extends State<ListCars> {

//   List<Images> imageList = [
//     Images( image:('images/1652625125006-modified.png'),index: 0,title: "UberX",price: "5"),
//     Images( image:('images/bus101-modified.png'),index: 1,title: "UberX",price: "4"),
//     Images( image:('images/van101-modified.png'),index: 2,title: "UberX",price: "3"),
//     Images( image:('images/car101-modified.png'),index: 3,title: "UberX",price: "55"),
//   ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//       ),
//       extendBodyBehindAppBar: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 10,left: 0,right: 0,bottom: 0),
//           child: Column(
//             children: [
//               ListOFCars(),
         
//             ],
//           ),
//       ),
//       ),
//     );
//   }
//   Widget ListOFCars (){
//     return Center(
//       child: SingleChildScrollView(
//         child: SizedBox(
//           width: (MediaQuery.of(context).size.width)-50,
//           height: (MediaQuery.of(context).size.height),
//           child: ListView.builder(
//             itemCount: imageList.length,
//             scrollDirection: Axis.vertical,
//             itemBuilder: (context,index)=>Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: Stack(
//                clipBehavior: Clip.none,
//                 children: [
                 
//                   Container(
                   
//                     child: Card(
            
//                 color: Colors.white,
//                 clipBehavior: Clip.antiAlias,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Container(
//                     width: (MediaQuery.of(context).size.width),
//                     height: (MediaQuery.of(context).size.height)-705,
//                     color: Color(0xffffbf00),
//                     ),
//                     ),
//                   ),
//                   Container(
                   
//                      child: Stack(
//                       clipBehavior: Clip.none,
//                        children: [
//                         Card(
//                          elevation: 5,
//                          color: Colors.white,
//                          clipBehavior: Clip.antiAlias,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(25),
//                          ),
//                          child: Container(
//                             width: (MediaQuery.of(context).size.width)-68,
//                              height: (MediaQuery.of(context).size.height)-705,
//                              color: Colors.white,
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: [
//                        Column(
//                          children: [
//                            Expanded(
//                             flex: 3,
//                              child: Padding(
//                               padding: const EdgeInsets.only(right: 100,),
//                              child: MaterialButton(
//                                onPressed: () { 
//                                   Navigator.of(context).push(Slide6(Page: InfoCars()));
//                                 },
//                                child: Text(
//                                  imageList[index].title,
//                                  style: TextStyle(
//                                    color: Colors.grey[500],
//                                    fontSize: 18,
//                                  ),
//                                ),
//                              ),
//                              ),
//                            ),
                         
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.only(right: 131,),
//                                child: Container(
                                                              
//                                 width: 70,
//                                 height: 25,
                               
//                                 child: Center(
//                                 child: Text(
//                                   imageList[index].price,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                                               ),
//                                decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.only(topRight: Radius.circular(25.0,),
//                                    bottomLeft: Radius.circular(25.0,),
//                                  ),
//                                  color: Color(0xffffbf00),
//                                                               ),
//                                                             ),
//                              ),
//                            ),
                        
                         
//                          ],
//                        ),
                       
                                 
//                         SizedBox(width: 0,),
                       
//                                          ],
//                                        ),
//                                      ),
                                     
//                                    ),
//                        ],
//                      ),
                
//                 ),
//                  Padding(
//                    padding: const EdgeInsets.only(right: 15),
//                    child: Align(
//                     alignment: Alignment.centerRight,
//                      child: Image(
                              
//                               image: AssetImage(
//                                 imageList[index].image,
                                
//                                 ),
                           
//                               width: (MediaQuery.of(context).size.width)-270,
//                               height: (MediaQuery.of(context).size.height)-700,
//                               fit: BoxFit.cover,
//                               ),
//                    ),
//                  ),
      
                  
//                 ],
//               ),
             
           
//             ),
//           ),
//         ),
//       ),
//     );

//   }
// }


// class Images {
//   String image;
//   int index;
//   String title;
//   String price;
//   Images({required this.image, required this.index, required this.title, required this.price});
// }




class ListCars extends StatefulWidget {
  const ListCars({Key? key}) : super(key: key);

  @override
  _ListCarsState createState() => _ListCarsState();
}

class _ListCarsState extends State<ListCars> {



  List<Images> imageList = [
    Images(
        image: ('images/1652625125006-modified.png'),
        index: 0,
        title: "Audi-Car-Real",
        price: "5"),
    Images(
        image: ('images/bus101-modified.png'),
        index: 1,
        title: "UberX",
        price: "4"),
    Images(
        image: ('images/van101-modified.png'),
        index: 2,
        title: "UberX",
        price: "3"),
    Images(
        image: ('images/car101-modified.png'),
        index: 3,
        title: "UberX",
        price: "55"),
  ];

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
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
          child: Column(
            children: [
              ListOFCars(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ListOFCars() {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: (MediaQuery.of(context).size.width) - 50,
          height: (MediaQuery.of(context).size.height),
          child: ListView.builder(
            itemCount: imageList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: (){  showModalBottomSheet(
                                                isDismissible: true,
                                                  backgroundColor:
                                                      Colors.lightBlueAccent,
                                                  isScrollControlled: true,
                                                  enableDrag: true,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(35.0),
                                                    ),
                                                  ),
                                                  clipBehavior: Clip.none,
                                                  context: context,
                                                  builder: (BuildContext
                                                          buildContext) =>
                                                      CarInfo(
                                                          imageList[index]));
                },

                                              //Navigator.of(context).push(Slide6(Page: InfoCars()));},
                child: Stack(
                  children: [
                    Container(
                      child: Card(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          width: (MediaQuery.of(context).size.width),
                          height: (MediaQuery.of(context).size.height) - 705,
                          color:  index.isEven? Colors.lightBlueAccent:Color(0xffffbf00),
                        ),
                      ),
                    ),
                    Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.white,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              width: (MediaQuery.of(context).size.width) - 68,
                              height: (MediaQuery.of(context).size.height) - 705,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,top:40 ,
                                            ),
                                            child: Text(
                                              imageList[index].title,
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              right: 131,
                                            ),
                                            child: Container(
                                              width: 70,
                                              height: 25,
                                              child: Center(
                                                child: Text(
                                                  imageList[index].price,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    25.0,
                                                  ),
                                                  bottomLeft: Radius.circular(
                                                    25.0,
                                                  ),
                                                ),
                                                color: Color(0xffffbf00),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(right: 25,
                      child: Container(
                        width: 180,
                        height:150,
                        child: Image(
                                        image: AssetImage(
                                          imageList[index].image,
                                        ),
                                        width:
                                            (MediaQuery.of(context).size.width) - 270,
                                        height: (MediaQuery.of(context).size.height) -
                                            700,
                                        fit: BoxFit.scaleDown,
                                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CarInfo(Images Car) {
    return Container(
      clipBehavior: Clip.none,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 10,
            top: -90,
            width: 400,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  offset: Offset(0, 25),
                  spreadRadius: 0.5,
                  blurRadius: 160,
                ),
              ]),
              child: Image(
                image: AssetImage(
                  Car.image,
                ),
                height: (MediaQuery.of(context).size.height) - 700,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 5,
            right: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Car.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "subtitle here",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white60),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 31,
                              width: 31,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: (){},
                                child: Icon(
                                  Icons.local_gas_station_rounded,
                                  color: Colors.lightBlueAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "65- MPG",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton.small(
                                
                                backgroundColor: Colors.white,
                                onPressed: (){},
                                child: Icon(
                                  Icons.people_rounded,
                                  color: Colors.lightBlueAccent,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "4 People",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                onPressed: (){},
                                child: Icon(
                                  FontAwesomeIcons.calendarDay,
                                  color: Colors.lightBlueAccent,
                                  size: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Daily",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      
                      height: 60,
                      decoration: BoxDecoration(
                     boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 160,
                )],
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                        "Book Now !",
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
          )
        ],
      ),
    );
  }
}

class Images {
  String image;
  int index;
  String title;
  String price;
  Images(
      {required this.image,
      required this.index,
      required this.title,
      required this.price});
}
