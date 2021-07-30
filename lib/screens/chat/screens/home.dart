import 'package:astro_app/screens/chat/widgets/category_selector.dart';
import 'package:astro_app/screens/chat/widgets/favorite_contacts.dart';
import 'package:astro_app/screens/chat/widgets/recent_chats.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   iconSize: 30.0,
        //   color: Colors.white,
        //   onPressed: () {},
        // ),
        centerTitle: true,
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          ),
        ),
        elevation: 0.0,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.search),
        //     iconSize: 30.0,
        //     color: Colors.white,
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: <Widget>[
          //CategorySelector(),
          Expanded(
            child: Container(
            height: 500.0,
            // decoration: BoxDecoration(
            //   color: Theme.of(context).accentColor,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(30.0),
            //     topRight: Radius.circular(30.0)
            //   )
            // ),
            child: Column(
              children: <Widget>[
               //FavoriteContacts(),
               RecentChats()
              ],
            ),
          ),
          )
        ],
      ),
    );
  }
}