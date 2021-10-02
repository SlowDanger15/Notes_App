import 'package:flutter/material.dart';
import 'package:notes_vault/screens/authenticate.dart';
import 'package:notes_vault/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:notes_vault/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //print(user);
    //return either home or autheticate
    if(user==null)
      return Authenticate();
    else
      return Home();
  }
}
