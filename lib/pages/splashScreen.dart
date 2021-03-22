import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../pages/homePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .25,
          ),
          Center(
            child: SizedBox(
                height: size.height / 3,
                width: size.width / 2,
                child: Image.asset("assets/icons/kubri_icon.png")),
          ),
          Container(
            width: size.width / 2,
            child: Center(
              child: FittedBox(
                child: Text(
                  "KUBRI",
                  style: TextStyle(
                      color: ColorsRes.primaryColor, fontSize: size.width / 5),
                ),
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
