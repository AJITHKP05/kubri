import 'package:flutter/material.dart';

class ServerSelectPage extends StatefulWidget {
  final VoidCallback onPress;

  const ServerSelectPage({Key key, this.onPress}) : super(key: key);
  @override
  _ServerSelectPageState createState() => _ServerSelectPageState();
}

class _ServerSelectPageState extends State<ServerSelectPage> {
  List<String> servers = ["asia", "usa", "south koria", "London"];
  int selectedServer = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Text(
                "Pick your Server",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: servers.length,
              itemBuilder: (context, index) => ServerTile(
                server: servers[index],
                onClick: () => _onClick(index),
                isSelected: index == selectedServer,
              ),
            ),
          )
        ],
      ),
    );
  }

  _onClick(int index) {
    selectedServer = index;
    widget.onPress();
    // setState(() {});
  }
}

class ServerTile extends StatelessWidget {
  final String server;
  final VoidCallback onClick;
  final bool isSelected;
  const ServerTile({Key key, this.server = "", this.onClick, this.isSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onClick();
      },
      leading: SizedBox(
          height: 30,
          width: 30,
          child: CircleAvatar(
            minRadius: 5,
            backgroundImage: AssetImage("assets/icons/usa_flag.png"),
          )),
      trailing: isSelected
          ? Icon(
              Icons.circle,
            )
          : Icon(Icons.radio_button_off_outlined),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(server), Icon(Icons.signal_cellular_alt)],
      ),
    );
  }
}
