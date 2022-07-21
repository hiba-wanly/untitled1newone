import 'package:flutter/material.dart';
class Expandedfour extends StatefulWidget {
  final String text;
  const Expandedfour({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandedfourState createState() => _ExpandedfourState();
}


class _ExpandedfourState extends State<Expandedfour> {
  late String firsthalf;
  late String secondhalf;
  @override
  void initState() {

    super.initState();
    if (widget.text.length>8){
      firsthalf=widget.text.substring(0,8);
      secondhalf=widget.text.substring(9,widget.text.length);
    }else{
      firsthalf=widget.text;
      secondhalf="";
    }
  }
  bool flag=true;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        child:secondhalf.length==""?
        Text(widget.text,style: Theme.of(context).textTheme.bodyText1,):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              flag?firsthalf:widget.text,
              style:Theme.of(context).textTheme.headline2,
            ),

            // InkWell(
            //   onTap: (){
            //     print("tapped");
            //     setState(() {
            //       flag=!flag;
            //     });
            //   },
            //   child:   Row(
            //     children: [
            //       Text(
            //         flag ? "Show more" : "Show less",
            //         style: TextStyle(color: Colors.orange,fontSize:16 ),),
            //       Icon(flag?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,color: Colors.amber,),
            //     ],
            //   ),
            // ),

          ],
        )
        ,
      ),
    );
  }
}
