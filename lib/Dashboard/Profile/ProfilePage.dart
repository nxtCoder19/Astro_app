import 'package:astro_app/Dashboard/CardSection/CardSectionAlignment.dart';
import 'package:astro_app/Dashboard/Profile/components/MoodSelectionScreen.dart';
import 'package:astro_app/Dashboard/Profile/components/curve_container_account.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/screens/addmedia/select_source.dart';
import 'package:astro_app/screens/chat/screens/home.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/getUserDetailsApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Widget placeholder = Container(color: Colors.grey);

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class ProfilePage extends StatefulWidget {

  String years;
  ProfilePage(this.years);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _current = 0;
  double rating = 19.0;

  String userName = "";
  _getName() async {
    final result = await GetUserDetailsApi.getUserName();
    setState(() {
      userName = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _getName();
  }

  // Widget swipeWidgetText(image, upperText, [lowerText = ""]) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         SizedBox(
  //           height: 8,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Image.asset(
  //               image,
  //               width: 26,
  //               height: 26,
  //             ),
  //             SizedBox(
  //               width: 6,
  //             ),
  //             Text(
  //               upperText,
  //               style: TextStyle(
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 18,
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(
  //           height: 8,
  //         ),
  //         Text(
  //           lowerText,
  //           style: TextStyle(
  //             color: Colors.grey,
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // List<Widget> yoFuck = [
    //   swipeWidgetText("assets/location_icon.png", "Swipe around the world!",
    //       "Passport to anywhere with tinder plus"),
    //   swipeWidgetText("assets/key_icon.png", "Control your profile",
    //       "Limit what other can see with Tinder Plus! "),
    //   swipeWidgetText("assets/reload_icon.png", "I mean't to swipe right",
    //       "Get Unlimited rewrad with tinder plus"),
    //   swipeWidgetText("assets/heart_icon.png", "Increase your Chances",
    //       "Get Unlimited likes with tinder plus! "),
    // ];
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[100],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: CurvedBottomClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 12,right: 16),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _getAppBarIcon(Icons.arrow_back_ios, (){
                            Navigator.pop(context);
                          }),
                          _getAppBarIcon(Icons.edit, () {
                            Navigator.pushNamed(context, EDIT_INFO_SCREEN);
                            // Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => EditProfile()));
                          })
                          // Icon(Icons.arrow_back_ios),
                          // Icon(Icons.edit)
                        ],
                          ),
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/photo.jpg"),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      userName == null ?
                      Text(
                        "Your Name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ) :
                      Text(userName,
                        //"Piyush Chaubey",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SETTING_SCREEN);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => SettingPage()));
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: AppTheme.appColour,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.settings, size: 36,color: AppTheme.white,),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "SETTINGS",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(9, 36, 0, 0),
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MoodSelectionScreen(widget.years)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: AppTheme.appColour,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.mood, size: 36,color: AppTheme.white,),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "MOOD",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SelectSource()));
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: AppTheme.appColour,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.add_a_photo, size: 36,color: AppTheme.white,),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "ADD PHOTOS",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 86,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              _myWidget('conversation board', Icons.message, () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }),
              SizedBox(
                height: 15,
              ),
              maximumDistance(),
              // _myWidget('Online', Icons.online_prediction_rounded, () {}),
              SizedBox(
                height: 15,
              ),
              _myWidget('Star Coin Wallet', Icons.search, () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }),
              SizedBox(
                height: 15,
              ),
              _myWidget('Blocked Users', Icons.block, () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>MessagesScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myWidget(String text, IconData icon, Function onPressed) {
    return InkWell(onTap: onPressed,
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.fromLTRB(26, 16, 26, 16),
        child: Container(width: MediaQuery.of(context).size.width*0.8,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _getIconButton(icon),
                  //Icon(icon, color: AppTheme.appColour,),
                  SizedBox(width: 15,),
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIconButton(IconData icon) {
  return ClipOval(
    child: Material(
      color: AppTheme.appColour, // button color
      child: InkWell(
        splashColor: Colors.red, // inkwell color
        child: SizedBox(width: 36, height: 36, child: Icon(icon, color: AppTheme.white,)),
        onTap: () {},
      ),
    ),
  );
}

Widget _getAppBarIcon(IconData icon, Function onPressed) {
  return InkWell(
    child: Icon(
      icon
    ),
    onTap: onPressed,
  );
}

Widget maximumDistance() {
    return Container(
      decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: MediaQuery.of(context).size.width*0.9,
      //padding: EdgeInsets.fromLTRB(10, 10, 10, 4),
      //decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Maximum Distance",
                style: TextStyle(
                    color: AppTheme.appColour,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${rating.round()} km.",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Slider(
            value: rating,
            onChanged: (newRating) {
              setState(() {
                rating = newRating;
              });
            },
            min: 18,
            max: 55,
            activeColor: AppTheme.appColour,
          )
        ],
      ),
    );
  }

}
