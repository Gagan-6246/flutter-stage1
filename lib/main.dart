import 'package:flutter/material.dart';
import 'package:stage1/tabs/first_tab.dart';
import 'package:stage1/tabs/second_tab.dart';
import 'package:stage1/tabs/third_tab.dart';

// validators, backbutton handler

//splash screen, photos, tabs, calendar,country and states, contacts,
//
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ));

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(title: Text('App Bar')),
            body: Column(
              children: <Widget>[
                TabBar(tabs: [
                  Tab(
                    icon: Icon(
                      Icons.home,
                      color: Colors.blue,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.blinds,
                      color: Colors.blue,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                  ),
                ]),
                Expanded(
                  child: TabBarView(children: [
                    //1st tab
                    First_tab(),
                    //2nd tab
                    Second_tab(),
                    //3rd tab
                    Third_tab(),
                  ]),
                )
              ],
            ),
          )),
    );
  }
}
