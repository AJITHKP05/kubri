import 'dart:async';

import 'package:flutter/material.dart';
import '../Resources/colors.dart';

class ConnectedScreen extends StatefulWidget {
  @override
  _ConnectedScreenState createState() => _ConnectedScreenState();
}

class _ConnectedScreenState extends State<ConnectedScreen> {
  Stopwatch _stopwatch = Stopwatch();
  String formatTime(int secs) {
    // var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _stopwatch.start();
    if (_stopwatch.isRunning) {
      setState(() {});
    }
    Timer.periodic(Duration(microseconds: 30), (timer) {
      if (_stopwatch.isRunning) {
        setState(() {});
      }
    });
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * .7,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(formatTime(_stopwatch.elapsed.inSeconds)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.asset("assets/icons/connected_icon.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _stopwatch.reset();
                },
                child: TextFormField(
                  initialValue: "DISCONNECT",
                  enabled: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: ColorsRes.primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: ColorsRes.primaryColor))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
