import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled1newone/animation/animateroute.dart';
import 'package:untitled1newone/cars/mainappbar.dart';
import 'package:untitled1newone/generated/l10n.dart';
import 'package:untitled1newone/theme/colors/color.dart';
class BookCar extends StatefulWidget {
  const BookCar({Key? key}) : super(key: key);

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  final formKey = GlobalKey<FormState>();

  bool Chosen= false;
  DateTimeRange dateTimeRange= DateTimeRange(start: DateTime.now(),
      end: (DateTime.now()).add(new Duration(days: 7)));

  Position? _position;
  var phonecontroller = TextEditingController();
  void _getCurrentLocation() async {
    Position position = await _determinePoition();
    setState((){
      _position = position;
    });
  }

  Future<Position> _determinePoition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location Permission are denied');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: Text(
          S.of(context).pageBookNow,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height)-370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.grey[200],
              ),
              child: Center(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: (MediaQuery.of(context).size.width),
                        padding:  EdgeInsets.only(top: 10,left: 15),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: (MediaQuery.of(context).size.width)-150,
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(
                                        S.of(context).pageYourLocation,
                                        style: Theme.of(context).textTheme.headline6,
                                      ),
                                      SizedBox(width: 5,),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                        color: Colors.orangeAccent,
                                      ),
                                      SizedBox(width: 2,),
                                      IconButton(
                                        onPressed: (){
                                          _getCurrentLocation();
                                          //MyLocation();
                                        },
                                        icon: Icon(
                                          Icons.location_pin,
                                          size: 25,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Center(
                                child: _position!= null ? Text('Current Location'+ _position.toString()) : Text('No Location Data'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     'enter your phone : ',
                    //     style: Theme.of(context).textTheme.headline6,
                    //   ),
                    // ),
                    // SizedBox(height: 5,),
                    Center(
                      child: Container(
                        width: (MediaQuery.of(context).size.width)-180,
                        padding:  EdgeInsets.only(top: 1,left: 15),
                        child: Center(
                          child: TextFormField(
                            controller: phonecontroller,
                            keyboardType: TextInputType.phone,

                            cursorColor: Color(0xffF5591F),

                            onFieldSubmitted: (value){
                              print(value);
                            },

                            validator: (value){
                              if(value!.isEmpty || value.length < 10){
                                return S.of(context).pagePhoneRequired;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.phone_android,
                                color: Color(0xffF5591F),
                              ),

                              hintText: S.of(context).pageYourPhone,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,top: 5),
                        child: InkWell(
                            child: Container(height: 80,
                              child: Row(children: [
                                Icon(
                                  Icons.date_range,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 20),
                                Column(children: [
                                  Text(S.of(context).pageLeavingDate, style: Theme.of(context).textTheme.subtitle2,),
                                  SizedBox(height: 20,),
                                  Text(dateTimeRange.start.toString().split(' ')[0],style: TextStyle(fontWeight:FontWeight.w400,color: Chosen?LightColors.green: LightColors.butto),)
                                ],),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: VerticalDivider(width: 20,thickness: 2,),
                                ),
                                Column(children: [
                                  Text(S.of(context).pageReturnDate,style: Theme.of(context).textTheme.subtitle2,),
                                  SizedBox(height: 20,),
                                  Text(dateTimeRange.end.toString().split(' ')[0],style: TextStyle(fontWeight: FontWeight.w400,color: Chosen?LightColors.green: LightColors.butto))
                                ]),

                              ],),
                            ),
                            onTap: PickDateRange
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width)-70,
                      padding:  EdgeInsets.only(top: 15),
                      child:Center(
                        child:TextField(
                          controller: timeinput, //editing controller of this TextField
                          decoration: InputDecoration(
                            icon: Icon(Icons.timer), //icon of text field
                            labelText: S.of(context).pageEnterTime,//label text of field
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if(pickedTime != null ){
                              print(pickedTime.format(context));   //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              print(parsedTime); //output 1970-01-01 22:53:00.000
                              String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                              print(formattedTime); //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                              setState(() {
                                timeinput.text = formattedTime; //set the value of text field.
                              });
                            }else{
                              print("Time is not selected");
                            }
                          },

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 10),
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
                              S.of(context).pageBookNow,
                              //style: Theme.of(context).textTheme.headline6,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color:Colors.black,
                              ),
                            ),
                            onPressed: (){
                              if (formKey.currentState!.validate()) {
                                print("Button Clicked");
                                this.dateTimeRange=dateTimeRange;
                                this.phonecontroller=phonecontroller;
                              }
                              print(dateTimeRange);
                              print(phonecontroller.toString());
                              print(timeinput.toString());
                              //Navigator.of(context).push(Slide7(Page: BookCar()));
                            },
                          ),
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
  // Widget map() {
  //   return new FlutterMap(
  //     options: new MapOptions(
  //       center: new LatLng(51.5, -0.09),
  //       zoom: 13.0,
  //     ),
  //     layers: [
  //       new TileLayerOptions(
  //         urlTemplate: "https://api.tiles.mapbox.com/v4/"
  //             "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
  //         additionalOptions: {
  //           'accessToken': '<PUT_ACCESS_TOKEN_HERE>',
  //           'id': 'mapbox.streets',
  //         },
  //       ),
  //       new MarkerLayerOptions(
  //         markers: [
  //           new Marker(
  //             width: 80.0,
  //             height: 80.0,
  //             point: new LatLng(51.5, -0.09),
  //             builder: (ctx) =>
  //             new Container(
  //               child: new FlutterLogo(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
  Widget MyLocation() {
    return Container(
      width: 200,
      height: 20,
      color: Colors.red,
      child: Center(
        child: _position!= null ? Text('Current Location'+ _position.toString()) : Text('No Location Data'),
      ),
    );
  }

  Future PickDateRange()async{
    DateTimeRange? newDateTimeRange= await showDateRangePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        saveText: "Choose"
    );
    if(newDateTimeRange== null)
      return ;

    setState(() {
      dateTimeRange= newDateTimeRange;
      Chosen=true;

    });

  }

}

