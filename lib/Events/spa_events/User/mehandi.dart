import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Events/con_events/User/upload.dart';

class Mehandi extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<Mehandi> {
  @override
  Widget build(BuildContext context) {
    Widget buildButton(IconData icon, String buttonTitle) {
      final Color tintColor = Colors.blue;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: tintColor),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: new Text(buttonTitle, style: new TextStyle(fontSize: 16.0,
                fontWeight: FontWeight.w600, color: tintColor),),
          )
        ],
      );
    }
    Widget twoButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 150,
            margin: EdgeInsets.all(30),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                String uid = auth.currentUser!.uid.toString();
                FirebaseFirestore.instance
                    .collection('Users')
                    .doc(uid)
                    .get()
                    .then((DocumentSnapshot documentSnapshot) {

                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new Upload(
                          contest: "Mehandi",
                        ),
                      ),
                    );
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff7a54ff),Color(0xff7a54ff)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints:
                  BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),),
        ],
      ),
    );
    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),

      child: RichText(
  text: TextSpan(
    //style: DefaultTextStyle.of(context).style,
    children: <TextSpan>[

      
      
      TextSpan(
        text: "General Rules:\n",
        style: TextStyle(color: Color(0xff7a54ff),fontWeight: FontWeight.bold,fontSize: 20),
      ),
      TextSpan(
                  text: '1)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 18, color: Colors.black)),TextSpan(
                  text: 'Participants can apply mehandi on their own hand or any other persons hand.\n',
                  style: TextStyle(
                      fontFamily: 'Nunito',fontSize: 18, color: Colors.black)),
             
     
              
              
      TextSpan(
        text: '2)',
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
        
                TextSpan(
                  text: 'The video should be 20- 30 minutes long it is in one shot and the camera should not move\n',
                  style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),
                ),
              
            
        
      
 
      TextSpan(
        text: '3)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),
        ),
                TextSpan(
                  text: 'Mehandi design should be creative and unique.\n',
                  style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),
                ),
              
              
              
      TextSpan(
        text: """4)""",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),
        ),
                TextSpan(
                  text: 'Edited photos in any way are not eligible\n',
                  style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),
                ),
              
              
             
      TextSpan(
        text: """5)""",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),
        ),
                TextSpan(
                  text: 'Mehandi tattoo designs that mimic tattoo (stickers) are not eligible for entry\n',
                  style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),
                ),
              
      TextSpan(
        text: """6)""",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),
        ),
                TextSpan(
                  text: 'Participants can use only normal type of mehandi (no extra colours)\n',
                  style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),
                ),
TextSpan(
                  text: '7)',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 18, color: Colors.black)),TextSpan(
                  text: 'Neatness will be observed in design.\n',
                  style: TextStyle(
                      fontFamily: 'Nunito',fontSize: 18, color: Colors.black)),
             
     
              
              
      

      
      
    ],
  ),
)
      
    );
    
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        debugShowCheckedModeBanner:false,
        home: new Scaffold(
            appBar: new AppBar(
              backgroundColor: Color(0xff7a54ff),
              title: new Text('Magical Mehandi',textAlign: TextAlign.center,),
              actions:<Widget>[
                
              ],
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/3/3f/Mehndi_front.JPG',
                    fit: BoxFit.cover,
                    height: 200.0,
                ),
                //You can add more widget bellow

                bottomTextSection,
                Padding(padding: const EdgeInsets.only(top: 0),),
                 Text("    FACULTY INCHARGES",
                  textAlign:TextAlign.left,
                  style:TextStyle(color: Color(0xff7a54ff),fontWeight: FontWeight.bold,fontSize: 20),),
                Padding(padding: const EdgeInsets.only(top: 20),),
                SingleChildScrollView(
                  child: DataTable(
                    //sortAscending: true,
                      sortColumnIndex: 0,
                      //columnSpacing: 2.0,
                      dataRowHeight: 70.0,
                      headingRowHeight: 40.0,
                      columns: [
                        DataColumn(label: Text("Name",
                          textAlign:TextAlign.start,
                          style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        DataColumn(label: Text("Dept",textAlign:TextAlign.start,
                          style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),),
                        DataColumn(label: Text("Phone",textAlign:TextAlign.start,
                          style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),)
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("Ms. K L Revathi,",style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),),),
                          DataCell(Text("MBA",style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),)),
                          DataCell(Text("89550041819",style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),))
                        ]),
                        
                      ]),
                ),

                Padding(padding: const EdgeInsets.only(top: 30),),
                Text("    STUDENT VOLUNTEERS",
                  textAlign:TextAlign.left,
                  style:TextStyle(color: Color(0xff7a54ff),fontWeight: FontWeight.bold,fontSize: 20),),
                Padding(padding: const EdgeInsets.only(top: 20),),
                SingleChildScrollView(
                  child: DataTable(
                    //sortAscending: true,
                      sortColumnIndex: 0,
                      //columnSpacing: 2.0,
                      dataRowHeight: 70.0,
                      headingRowHeight: 40.0,
                      columns: [
                        DataColumn(label: Text("Name",textAlign:TextAlign.start,
                          style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        DataColumn(label: Text("Dept",textAlign:TextAlign.start,
                          style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        DataColumn(label: Text("Phone",textAlign:TextAlign.start,
                          style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("Ms. N Jyosthna",style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),),),
                          DataCell(Text("MBA",style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),),),
                          DataCell(Text("832815025",style: TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: 'Nunito'),),),
                        ]),
                      ]),
                ),

                twoButtonsSection
              ],
            )
            
        )
    );//Widget with "Material design"
  }
}