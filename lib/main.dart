import "package:flutter/material.dart";

void main() => runApp(EventsPage());

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Manager App",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Events"),
            ),
            drawer: Drawer_Design(),
            body: Text("Hello")));
  }
}

class Drawer_Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250.0,
        child : Drawer(
          child: ListView(
            padding: EdgeInsets.all(0.0),

            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white12
                ),
                accountEmail: Text("Email" , style: TextStyle(
                    color: Colors.black
                ),),
                accountName: Text("Name" ,  style: TextStyle(
                    color: Colors.black
                ),),
                currentAccountPicture: Container(
                  child: Image(
                    image: AssetImage('images/login_icon.png'),
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
