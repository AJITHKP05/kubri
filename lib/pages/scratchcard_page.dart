import 'package:flutter/material.dart';
import '../Resources/colors.dart';

class ScratchCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * .5,
      // color: ColorsRes.greenColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * .2),
            child: Container(
              width: size.width * .5,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xFF919BA0),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF919BA0))),
              child: Center(
                child: Text(
                  "85673421",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Expire in 30 Days",
            style: TextStyle(color: Color(0xFF919BA0)),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * .2),
            child: Container(
              width: size.width * .5,
              height: 40,
              decoration: BoxDecoration(
                  // color: ColorsRes.buttonColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFF919BA0))),
              child: Center(
                child: Text(
                  "Sractch Card No",
                  style: TextStyle(color: Color(0xFF919BA0)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              width: size.width * .5,
              height: 40,
              decoration: BoxDecoration(
                  color: ColorsRes.buttonColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: ColorsRes.buttonColor)),
              child: Center(
                child: Text(
                  "Recharge",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
