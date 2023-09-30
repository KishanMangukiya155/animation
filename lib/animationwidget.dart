import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationController1;
  late AnimationController _animationController2;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3000),
        lowerBound: 0,
        upperBound: 100);

    _animationController1 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3000),
        lowerBound: 50,
        upperBound: 100);
    _animationController2 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 3000),
        lowerBound: 50,
        upperBound: 100);
    _animationController.forward();
    _animationController1.forward();
    _animationController2.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
        // print("hello");
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController1.reverse();
        print("hello");
      } else if (status == AnimationStatus.dismissed) {
        _animationController1.forward();
      }
    });
    _animationController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController2.reverse();
        print("hello");
      } else if (status == AnimationStatus.dismissed) {
        _animationController2.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width,
          ),
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  // print('${size.height / 100 * _animationController.value}');
                  return Transform.translate(
                    // flipX: _animationController.isAnimating,
                    // filterQuality: FilterQuality.medium,
                    // scale: _animationController.value,
                    offset: Offset(
                        0, (size.height / 300 * _animationController.value)),
                    // angle: _animationController.value,
                    child: Text(
                      "ભારત",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _animationController2,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        0, (size.height / 200 * _animationController2.value)),
                    // angle: _animationController2.value,
                    child: Container(
                        height: 200,
                        width: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://media.istockphoto.com/id/1194408359/photo/india-flag-flying-high-blue-sky-tricolour-flag.webp?b=1&s=170667a&w=0&k=20&c=F61rNWdVxAv4muy_j3pQNCA0dvs39z0LCiHb_x3oXK0="),
                                fit: BoxFit.cover))),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _animationController1,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0,
                        (size.height / 100 * _animationController1.value) - 25),
                    child: Text(
                      "India",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          wordSpacing: 10,
                          color: Colors.orange),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
