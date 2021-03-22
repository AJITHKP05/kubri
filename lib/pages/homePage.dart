import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Resources/colors.dart';
import '../pages/paymentPage.dart';

import 'connectedScreen.dart';
import 'connectingScreen.dart';
import 'notification_page.dart';
import 'server_select_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  List<Widget> list = [
    ConnectingScreen(),
    ConnectedScreen(),
    NotificationPage(),
    PaymentPage(),
  ];
  bool pickServer = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigator(),
        key: _scaffoldKey,
        drawer: _drawerWidget(),
        appBar: AppBar(
          leading: menuButton(),
          backgroundColor: Colors.white,
          title: Text(
            "KUBRI",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          centerTitle: true,
          bottom: index != 3 ? _bottomWidget() : null,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: pickServer
                  ? ServerSelectPage(
                      onPress: () {
                        _onServerPress();
                      },
                    )
                  : list[index]),
        ),
      ),
    );
  }

  _drawerWidget() => Drawer(
        child: Container(
          // color: Colors.accents[10],
          child: Column(
            children: [Text("")],
          ),
        ),
      );

  _bottomWidget() {
    final size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: InkWell(
        onTap: () {
          setState(() {
            pickServer = true;
          });
        },
        child: Container(
          padding: EdgeInsets.only(
            bottom: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: size.width * .26,
                  ),
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: CircleAvatar(
                        minRadius: 5,
                        backgroundImage:
                            AssetImage("assets/icons/usa_flag.png"),
                      )),
                  SizedBox(
                    width: size.width * .05,
                  ),
                  Text(
                    "NewYork, NY",
                    style: TextStyle(fontSize: size.width * .05),
                  ),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  menuButton() => InkWell(
      onTap: () {
        _scaffoldKey.currentState.openDrawer();
      },
      child: Icon(
        Icons.menu,
        color: Color(0xFF003C62),
      ));

  _bottomNavigator() {
    return BottomNavigationBar(
      selectedItemColor: ColorsRes.primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info_outlined),
          label: "not",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.headset_mic), label: "not"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "not"),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar), label: "not"),
      ],
      currentIndex: index,
      onTap: (inde) {
        setState(() {
          index = inde;
          pickServer = false;
        });
      },
    );
  }

  void _onServerPress() {
    setState(() {
      index = 0;
      pickServer = false;
    });
  }
}
