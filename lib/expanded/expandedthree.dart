import 'package:flutter/material.dart';
class Expandedthree extends StatefulWidget {
  final String text;
  const Expandedthree({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandedthreeState createState() => _ExpandedthreeState();
}


class _ExpandedthreeState extends State<Expandedthree> {
  late String firsthalf;
  late String secondhalf;
  @override
  void initState() {

    super.initState();
    if (widget.text.length>10){
      firsthalf=widget.text.substring(0,10);
      secondhalf=widget.text.substring(11,widget.text.length);
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
              style: Theme.of(context).textTheme.headline3,
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
