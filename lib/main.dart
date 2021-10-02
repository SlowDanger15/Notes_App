import 'package:flutter/material.dart';
import 'package:notes_vault/screens/wrapper.dart';
import 'package:notes_vault/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:notes_vault/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

