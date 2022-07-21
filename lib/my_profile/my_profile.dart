import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    final showDraggable = color == Colors.black;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DragTarget<Color>(
              onAccept: (data) => setState(() {
                color = data;
              }),
              builder: (context, _, __) => Container(
                color: color,
                width: 200,
                height: 200,
              ),
            ),
            IgnorePointer(
              ignoring: !showDraggable,
              child: Opacity(
                opacity: showDraggable ? 1 : 0,
                child: Draggable<Color>(
                  data: Colors.green,
                  child: Container(
                    color: Colors.green,
                    width: 200,
                    height: 200,
                  ),
                  feedback: Container(
                    color: Colors.orange,
                    width: 200,
                    height: 200,
                  ),
                  childWhenDragging: Container(
                    color: Colors.red,
                    width: 200,
                    height: 200,
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
