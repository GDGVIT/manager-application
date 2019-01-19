import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manager_app/authentication.dart';

class EventsList extends StatelessWidget {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final GoogleSignInAccount googleUser;

  const EventsList(
      {Key key,
        @required this.googleUser,
        @required this.auth,
        @required this.googleSignIn})
      : assert(googleUser != null),
        assert(auth != null),
        assert(googleSignIn != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Manager App",
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                "Events Manager",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            drawer: SizedBox(
                width: 250.0,
                child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.all(0.0),
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.white12),
                        accountEmail: Text(
                          googleUser.email,
                          style: TextStyle(color: Colors.black),
                        ),
                        accountName: Text(
                          googleUser.displayName,
                          style: TextStyle(color: Colors.black),
                        ),
                        currentAccountPicture: Container(
                          child: CircleAvatar(
                              backgroundImage:
                              NetworkImage(googleUser.photoUrl)),
                        ),
                      ),
                      ListTile(
                        title: Text("Sign Out"),
                        onTap: () {
                          auth.signOut();
                          googleSignIn.signOut();
                          Navigator.pushAndRemoveUntil<void>(
                              context,
                              MaterialPageRoute(builder: (_) => AuthScreen()),
                                  (_) => false);
                        },
                      )
                    ],
                  ),
                )),
            body: ListRow()
          //Column(

          // : Color.fromRGBO(248, 248, 248, 0.0),
          /*Padding(
              padding: EdgeInsets.only(
                  right: 15.0, left: 15.0, top: 20.0, bottom: 20.0),*/
          //children: <Widget>[ListRow()])
        ));
  }
}

class ListRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    {
      return Container(


          child: new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: new ConstrainedBox(

                  constraints: BoxConstraints(minHeight: 20.0),
                  //margin: EdgeInsets.only(top: 20.0, bottom: 15.0),

                  //child : SingleChildScrollView(
                  //padding: EdgeInsets.all(10.0),
                  child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        //SingleChildScrollView(
                        //Flexible(
                        //child :
                        //GradientAppBar("Events"),
                        //child :
                        Container(
                            height: 80.0,
                            // height:300.0,
                            child :
                            StreamBuilder(
                                stream: Firestore.instance.collection('bandnames').snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    return Center(child: Text('Loading...'));
                                  return //Expanded(
                                    //    child:
                                    ListView.builder(
                                      //  physics: const NeverScrollableScrollPhysics(),
                                        itemExtent: 80.0,
                                        itemCount: snapshot.data.documents.length,
                                        padding: new EdgeInsets.symmetric(vertical: 4.0),
                                        itemBuilder: (context, index) => _buildListItem(
                                            context, snapshot.data.documents[index]));
                                })),

                        //)
                        Container(
                          height:30.0,
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: RaisedButton(
                            padding: EdgeInsets.all(13.0),
                            onPressed: () => debugPrint("Hello"),
//                color: Colors.grey[350],fl
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(80.0),
                                  right: Radius.circular(80.0),
                                )),
                            //disabledColor: Colors.pink,
                            elevation: 2.0,
                            child: Text(
                              "Add Event",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          alignment: Alignment(-1.0, 0),
                          margin: EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            "COMPLETED EVENTS",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          height:200.0,
                          child :
                          StreamBuilder(
                              stream: Firestore.instance.collection('bandnames').snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData)
                                  return Center(child: Text('Loading...'));
                                return
                                  //Expanded(
                                  // child:
                                  ListView.builder(
                                    //physics: const NeverScrollableScrollPhysics(),
                                      itemExtent: 80.0,
                                      itemCount: snapshot.data.documents.length,
                                      padding: new EdgeInsets.symmetric(vertical: 4.0),
                                      itemBuilder: (context, index) => _buildListItem(
                                          context, snapshot.data.documents[index]));
                              }),
                        )]

                    //],

                  )) )); }
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return new Container(
      //height: 140.0,
        margin: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 4.0,
        ),
        child: new Stack(
          children: <Widget>[
            new Container(
              //height: 140.0,
              //padding: EdgeInsets.only(top: 2.0),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                decoration: new BoxDecoration(
                  color: new Color(0xFF333366),
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: new Column(children: <Widget>[
                  //SingleChildScrollView(
                  //      child:
                  new Card(
                      margin: EdgeInsets.all(0.0),
                      elevation: 2.0,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new ListTile(
                              title: new Text(
                                document['name'],
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle:
                              new Text(document['votes'].toString()),
                            )
                          ])),
                ])),
          ],
        ));
  }
}

/*new SingleChildScrollView(
child : Container(
  margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
  //constraints: new BoxConstraints.expand(),
  child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      new Container(height: 2.0),
      new Text(
        "Hi ",
      ),
      new Container(height: 2.0),
      new Text("Hi 1"),
      new Container(
          margin: new EdgeInsets.symmetric(vertical: 2.0),
          height: 2.0,
          width: 1.0,
          color: new Color(0xff00c6ff)),

    ],
  ),
));
*/
/*
class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new PlanetRow();
  }
}

class PlanetRow extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Container(
        height: 200.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Container(
          height: 200.0,
          margin: new EdgeInsets.only(left: 46.0),
          decoration: new BoxDecoration(
            color: new Color(0xFF333366),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 1.0, bottom: 1.0, left: 64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ListTile(
                  leading: Text('Leading'),
                  //subtitle: Text('subtitle'),
                  //trailing: Text('trailing'),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(document['name']),
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                        ),
                        child: Text(document['votes'].toString()),
                      )
                    ],
                  ),
                  onTap: () {
                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap =
                          await transaction.get(document.reference);
                      await transaction.update(freshSnap.reference, {
                        'votes': freshSnap['votes'] + 1,
                      });
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('bandnames').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: Text('Loading...'));
          return Expanded(
            child : ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]))
          );});
  }
}*/
/*
class Drawer_Design extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250.0,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white12),
                accountEmail: Text(
                  "Email",
                  style: TextStyle(color: Colors.black),
                ),
                accountName: Text(
                  "Name",
                  style: TextStyle(color: Colors.black),
                ),
                currentAccountPicture: Container(
                  child: Image(
                    image: AssetImage('images/login_icon.png'),
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
              ),
              ListTile(
                title: Text("Sign Out"),
                onTap: () {
                  auth.signOut();
                  googleSignIn.signOut();
                },
              )
            ],
          ),
        ));
  }

}
*/
