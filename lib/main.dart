// import 'package:demoproject/CategoriesTab.dart';
// import 'package:demoproject/FilterPage.dart';
// import 'package:demoproject/Home.dart';
// import 'package:demoproject/MenTabScreen.dart';
// import 'package:demoproject/utility.dart';
// import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
      
// //         primarySwatch: Colors.blue,
// //       ),
// //       home:  MyApp(),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: _title,
//       home: FilterPage(),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: DefaultTabController(
//         initialIndex: 1,
//         length: 5,

//         child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.white,
            
//               title:                 Center(
//                                   child: Text('Categories',
            
//              style:
//                     text.copyWith(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                     )),),
//                     actions: [
//                         Padding(
//                           padding: const EdgeInsets.only(  right: 30 ),
//                           child: CircleAvatar(
//                       backgroundColor:Color(0xffE4E4E4) ,
//                       child:Icon(Icons.search,
//                            color: Colors.black,
//                       ) ,
//                                       ),
//                         ),
//                     ],
            
        
           
//           ),
//           body: Column(
//             children: [
//                      Center(
//          child: Container(
//           height: 40,
//           color: Color(0xffFDFAEB),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//                 Image.asset("assets/tshirt.png"),
//                  SizedBox(
//                   width: 8,
//                  ),
//                 Text("More than 7000+ products to choose from ")
//             ],
//           ),
//          ),
//        ),
//                   Container(
//                     width: double.infinity,
//                     height: 50,
//                     child: TabBar(
//               indicatorColor: Colors.black,
              
//               // labelPadding:EdgeInsets.only( top: 10 ) ,
//               indicatorSize: TabBarIndicatorSize.label,
              
//               // indicatorPadding: EdgeInsets.only( top: 5 ) ,
              
//               // padding: EdgeInsets.only( top: 40 ),
               
//               tabs: <Widget>[
//                  Text("Men",
//                  style: text.copyWith(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500
//                  ),
//                  ),
//                     Text("Women",
//                  style: text.copyWith(
//                     fontSize: 14,
                    
//                  ),
//                  ),
//                     Text("Kids",
//                  style: text.copyWith(
//                     fontSize: 14,
                    
//                  ),
//                  ),
//                      Text("Beauty",
//                  style: text.copyWith(
//                     fontSize: 14,
                    
//                  ),
//                  ),
//                      Text("Accessories",
//                  style: text.copyWith(
//                     fontSize: 14,
                    
//                  ),
//                  ),
             
//               ],
//             ),
//                   ),
//               Container(
//                 height: MediaQuery.of(context).size.height/1.3,
//                 child: TabBarView(
//                   // viewportFraction: 0.8,
//                  children: <Widget>[
//                    CategoriesScreen(),
//                    CategoriesScreen(),
//                    CategoriesScreen(),
//                    CategoriesScreen(),
//                    CategoriesScreen(),
//                  ],
//                     ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:linear_step_indicator/linear_step_indicator.dart';
import 'dart:math';

import 'animatedscreen.dart';
const int STEPS = 5;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Step Indicator Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FullLinearIndicatorDemo(),
    );
  }
}

class FullLinearIndicatorDemo extends StatefulWidget {
  const FullLinearIndicatorDemo({Key? key}) : super(key: key);

  @override
  _FullLinearIndicatorDemoState createState() =>
      _FullLinearIndicatorDemoState();
}

class _FullLinearIndicatorDemoState extends State<FullLinearIndicatorDemo> {
  final pageController = PageController();
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (timeStamp) {
        Timer.periodic(
          const Duration(milliseconds: 350),
          (_) {
            if (mounted) {
              initialPage += 1;
              if (initialPage == STEPS - 1) {
              } else {
                pageController.jumpToPage(initialPage);
              }
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Center(
        child: 
             HomeScreen()
      ),
    );
  }
}

class StepIndicatorDemo extends StatelessWidget {
  const StepIndicatorDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: 
              HomeScreen()
      ),
    );
  }
}

class StepIndicatorPageViewDemo extends StatefulWidget {
  const StepIndicatorPageViewDemo({Key? key}) : super(key: key);

  @override
  _StepIndicatorPageViewDemoState createState() =>
      _StepIndicatorPageViewDemoState();
}

class _StepIndicatorPageViewDemoState extends State<StepIndicatorPageViewDemo> {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StepIndicatorPageView(
        steps: STEPS,
        indicatorPosition: IndicatorPosition.top,
        labels: List<String>.generate(STEPS, (index) => "Step ${index + 1}"),
        controller: _pageController,
        complete: () {
          //typically, you'd want to put logic that returns true when all the steps
          //are completed here
          return Future.value(true);
        },
        children: List<Widget>.generate(
          STEPS,
          (index) => Container(
            color: Color(0xffffffff),
            child: Center(
              child: Text(
                "Page ${index + 1}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}













class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation? _arrowAnimation, _heartAnimation;
   AnimationController ? _arrowAnimationController, _heartAnimationController, _animationController;
Animation<Offset> ?  _animation;
  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
        //  _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -0.4)).animate(
        // _animationController!);
         _animation =  Tween<Offset>(begin: Offset(0, 10), end: Offset(110, 10)).animate(
        _arrowAnimationController!);
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController!);

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController!));

    _heartAnimationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController!.repeat();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        //     SlideTransition(
        //   position: _animation!,
        //   child: Center(child: Text("My Text")),
        // ),
          firstChild(),
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
          SizedBox(
            height: 50.0,
          ),
        ElevatedButton(
            // color: Colors.white,
            // textColor: Colors.black,
            // padding: const EdgeInsets.all(12.0),
            child: Text('Start Container Animation'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimatedScreen()));
            },
            // splashColor: Colors.red,
          )
        ],
      ),
    );
}
      var val = 10.0;
  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController!,
          builder: (context, child) => Transform.translate(
                // angle: _arrowAnimation!.value,
                offset: _animation!.value,
                child: Icon(
                  Icons.expand_more,
                  size: 50.0,
                  color: Colors.black,
                ),
              ),
          //  child:
        ),
        // Slider(value: val, onChanged: (va){

        // }),
        ElevatedButton(
          // color: Colors.white,
          // textColor: Colors.black,
          // padding: const EdgeInsets.all(12.0),
          child: Text('Start Icon Animation'),
          onPressed: () {
            // _arrowAnimationController.
            _arrowAnimationController!.isCompleted
                ? _arrowAnimationController!.reverse()
                : _arrowAnimationController!.forward();
          },
          // splashColor: Colors.red,
        )
      ],
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController!,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation!.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ElevatedButton(
              // padding: const EdgeInsets.all(12.0),
              // color: Colors.white,
              // textColor: Colors.black,
              child: Text('Start Beating Heart Animation'),
              onPressed: () {
                _heartAnimationController!.forward();
              },
              // splashColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
