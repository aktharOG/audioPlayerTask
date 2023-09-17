import 'package:flutter/material.dart';

push(BuildContext context, page) {
  Navigator.push(context, fadeRoute(page));
}

pushSlideToLeft(BuildContext context, page) {
  Navigator.push(context, SlideTransition1(page));
}

pushSlide(BuildContext context, page) {
  Navigator.push(context, SlideTransition2(page));
}




pushAndReplace(BuildContext context, page) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
  );
}

pushAndRemoveUntil(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (_) => page,
    ),
    (_) => false,
  );
}

pop(BuildContext context) {
  Navigator.pop(context);
}

Route fadeRoute(route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(0.0, 1.0);
      // const end = Offset.zero;
      // const curve = Curves.ease;

      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
        opacity: animation,
        //  position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// Route slideRoute(route) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => route,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.easeIn;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

class SlideTransition1 extends PageRouteBuilder {
  final Widget page;

  SlideTransition1(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(animation),
          child: page,
        );
      });
}



class SlideTransition2 extends PageRouteBuilder {
  final Widget page;

  SlideTransition2(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(animation),
          textDirection: TextDirection.rtl,
          child: page,
        );
      });
}


