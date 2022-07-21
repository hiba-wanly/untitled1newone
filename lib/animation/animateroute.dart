import 'package:flutter/material.dart';

class SlideRight extends PageRouteBuilder {
  final Page;
  SlideRight({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        var begin = 0.0;
        var end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //  //انتقال من داخل الشاشة الى الخارج
        return ScaleTransition(scale: tween.animate(curvesanimation) ,child: child,);
      }
  );
}

class SlideLeft extends PageRouteBuilder {
  final Page;
  SlideLeft({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        transitionDuration: Duration(seconds: 8,);
        //  //اتجاه الانتقال x,y
        // // var begin = Offset(0.0, 1.0);
        var begin = 0.0;
        var end = 1.0;
        //  //كمية الانتقال نغطية الشاشة
        //  //var end = Offset(0, 0.0);
        var tween = Tween(begin: begin, end: end);
        //  //var offsetAnimation = animation.drive(tween);
        //  //curveشكل الانتقال
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //  //انتقال من اليمين الى اليسار او ....
        //  //return SlideTransition(position: tween.animate(Curvesanimation), child:  child,);
        //  //انتقال من داخل الشاشة الى الخارج
        return ScaleTransition(scale: tween.animate(curvesanimation) ,child: child,);
        //  //انتقال بشكل تدوير
        //  return RotationTransition(turns: tween.animate(curvesanimation) ,child: child,);
        //return Align(alignment: Alignment.center, child: SizeTransition(sizeFactor: animation, child: child),);
        //انتقال من خلال الشفافية
        // return FadeTransition(opacity: animation, child: child,);
        //الانتقال من خلال عمليتين تدوير و انسحاب او ..
        //return ScaleTransition(scale: tween.animate(curvesanimation) , child: RotationTransition(turns: tween.animate(curvesanimation), child: child,),);
      }
  );
}

class Slide3 extends PageRouteBuilder {
  final Page;
  Slide3({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        var begin = 0.0;
        var end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //الانتقال من خلال عمليتين تدوير و انسحاب او ..
        return FadeTransition(opacity: animation, child: child,);

      }
  );
}

class Slide5 extends PageRouteBuilder {
  final Page;
  Slide5({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        var begin = 0.0;
        var end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //  //انتقال بشكل تدوير
        return RotationTransition(turns: tween.animate(curvesanimation) ,child: child,);

      }
  );
}

class Slide6 extends PageRouteBuilder {
  final Page;
  Slide6({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        var begin = 0.0;
        var end = 1.0;
        var tween = Tween(begin: begin, end: end);
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //انتقال من خلال الشفافية
        return FadeTransition(opacity: animation, child: child,);
      }
  );
}

class Slide7 extends PageRouteBuilder {
  final Page;
  Slide7({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        var begin = Offset(0.0, 1.0);
        var end = Offset(0, 0.0);
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //  //انتقال من اليمين الى اليسار او ....
        return SlideTransition(position: tween.animate(curvesanimation), child:  child,);
      }
  );
}


class Slide8 extends PageRouteBuilder {
  final Page;
  Slide8({this.Page})
      : super(
      pageBuilder :(context, animation, animationtwo) => Page ,
      transitionsBuilder:(context, animation, animationtwo, child)
      {
        transitionDuration: Duration(seconds: 8,);
        //  //اتجاه الانتقال x,y
        var begin = Offset(0.0, 1.0);
        // var begin = 0.0;
        // var end = 1.0;
        //  //كمية الانتقال نغطية الشاشة
        var end = Offset(0, 0.0);
        var tween = Tween(begin: begin, end: end);
        //  //var offsetAnimation = animation.drive(tween);
        //  //curveشكل الانتقال
        var curvesanimation = CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        //انتقال من اليمين الى اليسار او ....
        return SlideTransition(position: tween.animate(curvesanimation), child:  child,);
      }
  );
}