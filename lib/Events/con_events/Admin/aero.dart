import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/firestore/youtube_player.dart';

// ignore: camel_case_types
class Aero_Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AERO MODELLING"),
      ),
      floatingActionButton: null,
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("AeroModelling").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            scrollDirection: Axis.vertical,
            primary: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              return new AwesomeListItem(
                  title: document['displayName'],
                  content: document['email'],
                  color: Color(0xFFEF7A85),
                  image: document['image']);
            }).toList(),
          );
        },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height / 4.75);
    p.lineTo(0.0, size.height / 3.75);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

// ignore: must_be_immutable
class AwesomeListItem extends StatefulWidget {
  var title;
  var content;
  var color;
  var image;

  AwesomeListItem(
      {required this.title,
      required this.content,
      required this.color,
      required this.image});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(4.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {
          FirebaseAuth auth = FirebaseAuth.instance;
          String uid = auth.currentUser!.uid.toString();
          FirebaseFirestore.instance
              .collection('Paper')
              .doc(uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YtPage(
                  name: documentSnapshot['name'],
                  rollno: documentSnapshot['rollno'],
                  topic: documentSnapshot['topic'],
                  url: documentSnapshot['url'],
                ),
              ),
            );
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              new Container(width: 10.0, height: 190.0, color: widget.color),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 20.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: new Text(
                          widget.content,
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                height: 150.0,
                width: 150.0,
                color: Colors.white,
                child: Stack(
                  children: <Widget>[
                    new Transform.translate(
                      offset: new Offset(50.0, 0.0),
                      child: new Container(
                        height: 100.0,
                        width: 100.0,
                        color: widget.color,
                      ),
                    ),
                    new Transform.translate(
                      offset: Offset(10.0, 20.0),
                      child: new Card(
                        elevation: 20.0,
                        child: new Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 10.0,
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              image: DecorationImage(
                                image: NetworkImage(widget.image),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
