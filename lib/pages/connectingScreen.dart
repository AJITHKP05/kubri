// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_openvpn/flutter_openvpn.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:fluttertoast/fluttertoast.dart';
import '../Resources/colors.dart';

class ConnectingScreen extends StatefulWidget {
  @override
  _ConnectingScreenState createState() => _ConnectingScreenState();
}

class _ConnectingScreenState extends State<ConnectingScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await FlutterOpenvpn.init(
      localizedDescription: "KUBRI",
      providerBundleIdentifier: "com.example.vpnApp.RunnerExtension",
    ).then((value) async {
      print(value);
      Fluttertoast.showToast(msg: value.toString(), textColor: Colors.red);
      await FlutterOpenvpn.lunchVpn(
        "3.86.230.13",
        (isProfileLoaded) {
          print('isProfileLoaded : $isProfileLoaded');
        },
        (vpnActivated) {
          print('vpnActivated : $vpnActivated');
        },
        user: 'openvpn',
        pass: 'complicat3epa55',
        onConnectionStatusChanged:
            (duration, lastPacketRecieve, byteIn, byteOut) => print(byteIn),
        // expireAt: DateTime.now().add(
        //   Duration(
        //     seconds: 1800,
        //   ),
        // ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * .7,
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    // height: 55,
                    child: TextFormField(
                      validator: (val) {
                        if (val.isEmpty)
                          return "Please enter Phone No / Username";
                        return null;
                      },
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          hintText: "Phone No / Username",
                          hintStyle: TextStyle(color: Color(0xFF8B959A)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    // height: 55,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val.isEmpty) return "Please enter Pincode";
                        if (val.length < 4) return "Pincode must have 4 digits";
                        return null;
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          hintText: "Pincode",
                          hintStyle: TextStyle(color: Color(0xFF8B959A)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: InkWell(
                      onTap: () {
                        if (_formkey.currentState.validate()) print("pressed");
                      },
                      child: Image.asset("assets/icons/connect_icon.png")),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: Center(
                      child: Text.rich(
                    TextSpan(
                        text: "Don't have a pin ! ",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                              text: "Sign up",
                              style: TextStyle(color: ColorsRes.primaryColor))
                        ]),
                  )),
                )
              ],
            )),
      ),
    );
  }
}
