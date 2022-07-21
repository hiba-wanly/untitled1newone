import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';



class Maps extends StatefulWidget {

  Maps({Key? key}) : super(key: key);

  //get point => LatLng(49.5, -0.09);
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  double long = 49.5;
  double lat = -0.09;
  var location = [];


  @override
  Widget build(BuildContext context) {


    return Center(
      child: Container(
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                options: MapOptions(

                  center:LatLng(32.010532,35.867756),

                  zoom: 8.0,
                ),
                layers: [
                  TileLayerOptions(
                      urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        point: LatLng(32.010532,35.867756),

                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 34.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Card(
            //         child: TextField(
            //           decoration: InputDecoration(
            //             contentPadding: EdgeInsets.all(16.0),
            //             hintText: "Search for your localisation",
            //             prefixIcon: Icon(Icons.location_on_outlined),
            //           ),
            //         ),
            //       ),
            //       Card(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             children: [
            //               Text(
            //                   "${location.first.countryName},${location.first.locality}, ${location.first.featureName}"),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

