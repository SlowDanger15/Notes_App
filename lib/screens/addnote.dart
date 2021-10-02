import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_vault/models/user.dart';
import 'package:notes_vault/services/auth.dart';



class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

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
                      child: Text('Save',style: TextStyle(fontSize: 20.0),),
                      onPressed: add,
                    ),
                  ],
                ),
                SizedBox(height: 15.0,),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText:'Title'
                        ),
                        style: TextStyle(
                          fontSize: 32.0,fontWeight: FontWeight.bold,color: Colors.black
                        ),
                        onChanged: (val) {
                          title = val;
                        },
                        maxLines: 2,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.75,
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                              hintText:'Description'
                          ),
                          style: TextStyle(
                              fontSize: 20.0,color: Colors.black
                          ),
                          onChanged: (val) {
                            des = val;
                          },
                          maxLines: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void add() async{

    final FirebaseUser user =  await auth.currentUser();
    final uid = user.uid;
    CollectionReference ref = Firestore.instance.collection('users')
        .document(uid)
        .collection('notes');

    var data = {
      'title': title,
      'des': des
    };

    ref.add(data);

    Navigator.pop(context);
  }
}
