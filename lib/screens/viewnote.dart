import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_vault/models/user.dart';
import 'package:notes_vault/services/auth.dart';



class ViewNote extends StatefulWidget {

  final Map data;
  final DocumentReference ref;
  ViewNote({ this.data,this.ref });

  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {

  //final AuthService _auth = AuthService();

  String title;
  String des;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[200],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Icon(Icons.arrow_back,size: 20.0,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      child: Icon(Icons.delete_forever,size: 20.0,),
                      onPressed: delete,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.data['title']}',
                      style: TextStyle(
                          fontSize: 32.0,fontWeight: FontWeight.bold,color: Colors.black
                      ),

                      maxLines: 2,
                    ),
                    SizedBox(height: 15.0,),
                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height*0.75,
                      child: Text(
                        '${widget.data['des']}',
                        style: TextStyle(
                            fontSize: 20.0,color: Colors.black
                        ),

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void delete() async{

    await widget.ref.delete();
    Navigator.pop(context);
  }
}
