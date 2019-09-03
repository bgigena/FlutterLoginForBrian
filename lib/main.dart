import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:loginproviders/src/pages/home_page.dart';
import 'package:loginproviders/src/pages/login_page.dart';
import 'package:loginproviders/login_state.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LoginState>(
      builder: (BuildContext context) => LoginState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
                print(state.isLoggedIn);
            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        },
      ),
    );
  }
}