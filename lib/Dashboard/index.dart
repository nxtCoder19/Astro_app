
import 'dart:ui';
import 'package:astro_app/Dashboard/CardSection/CardSectionAlignment.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TabController _tabController;
  bool switchSelect = false;
  bool v = false;

  @override
  void initState() {
//    _tabController.addListener((){
//      print('my index is'+ _tabController.index.toString());
//    });

    super.initState();
  }

  // Widget customSwitch({bool select}) {
  //   return (select == true)
  //       ? Transform.scale(
  //           scale: 2.0,
  //           child: Switch(
  //             value: switchSelect,
  //             onChanged: (value) {
  //               print(value);
  //               print(switchSelect);
  //               setState(() {
  //                 switchSelect = value;
  //                 print(switchSelect);
  //               });
  //             },
  //             activeThumbImage: AssetImage("assets/tinder.png"),
  //           ),
  //         )
  //       : ImageIcon(
  //           AssetImage("assets/tinder_grey.png"),
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'msc',
      home: new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new AppBar(
            elevation: 2.0,
            backgroundColor: Colors.white,
            flexibleSpace: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                new TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(color: Colors.transparent),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.red[400],
                  tabs: [
                    new Tab(
                        icon: new ImageIcon(
                      AssetImage(
                        "assets/account_grey.png",
                      ),
                    )),
//                     new Tab(
//                       icon: TinderSwitch(
//                         value: v,
//                         onChanged: (value) {
//                           print(value);
//                           setState(() {
//                             v = value;
//                             //print(v);
//                           });
//                         },
//                       ),
// //                      child: customSwitch(select: true),
//                     ),
                    new Tab(
                        icon: ImageIcon(
                      AssetImage("assets/chat_icon.png"),
                    )),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            //controller: _tabController,
            children: <Widget>[
              //AccountTab(),
              Text('a'),
              CardsSectionAlignment(context),
              //ChatTab(),
            ],
          ),
        ),
      ),
    );
  }
}
