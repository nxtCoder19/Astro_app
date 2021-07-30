

import 'package:astro_app/Dashboard/Profile/ProfilePage.dart';
import 'package:astro_app/Dashboard/tinderCard/provider/feedback_position_provider.dart';
import 'package:astro_app/Dashboard/tinderCard/widget/bottom_buttons_widget.dart';
import 'package:astro_app/Dashboard/tinderCard/widget/user_card_widget.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/model/MatchesDetails.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/searchApi.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class HomePage extends StatefulWidget {

  String years;
  int preference;

  HomePage(this.years, this.preference);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final List<User> users = dummyUsers;
  int _current = 0;

  //String age = '18-45';
  //int preference = 3;
  String seeking = 'M';
  int startLimit = 0;
  int endLimit = 3;

  //Future<List> searchDetails;
  List<MatchesDetails> users;
  _loadMatches() async{
    List<MatchesDetails> matchDetailsList;
    matchDetailsList = await SearchApi.getMatches(widget.years, widget.preference, seeking, startLimit, endLimit);
    if (users == null) {
      users = new List<MatchesDetails>();
    }
    users.addAll(matchDetailsList);
    setState(() {
      
    });
    print('afgrtfgaa'+users[0].zodiaccard);
  }

  @override
  void initState() {
    super.initState();
    _loadMatches();
  }

  @override
  Widget build(BuildContext context) { 

    List<Widget> yoFuck = [
      swipeWidgetText("assets/images/location_icon.png", "Swipe around the world!",
          "Passport to anywhere with Cielo plus"),
      swipeWidgetText("assets/images/key_icon.png", "Control your profile",
          "Limit what other can see with Cielo Plus! "),
      swipeWidgetText("assets/images/reload_icon.png", "I mean't to swipe right",
          "Get Unlimited rewrad with Cielo plus"),
      swipeWidgetText("assets/images/heart_icon.png", "Increase your Chances",
          "Get Unlimited likes with Cielo plus! "),
    ];

    return Scaffold(
        appBar: buildAppBar(),
                body: Column(
                  children: [
                    Container(
                    child: Column(children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 70,
                        
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        
                        ),
                        
                        items: yoFuck,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(
                          yoFuck,
                          (index, url) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.blue
                                      : Color.fromRGBO(0, 0, 0, 0.2)),
                            );
                          },
                        ),
                      ),
                    ],),
                  ),
                    //BottomButtonsWidget(),
                    //Expanded(child: Container()),
                    //users.isEmpty
                    users == null
                        ? 
                        Container(
                          //height: MediaQuery.of(context).size.height/4,
                          child: CircularProgressIndicator(
                            valueColor:new AlwaysStoppedAnimation<Color>(AppTheme.appColour)),
                        )
                        :
                        users.length == 0 
                        ?
                        Text('No More user found for your matches',textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28,color: AppTheme.appColour),)
                        : Stack(children: users.map(buildUser).toList()),
                    
                    
                  ],
                ),
      );
  }

  Widget swipeWidgetText(image, upperText, [lowerText = ""]) {
    return FittedBox(
          child: Container(
          child: Column(
      children: <Widget>[
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              width: 26,
              height: 26,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              upperText,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          lowerText,
          style: TextStyle(
            color: Colors.grey,
          ),
        )
      ],
          ),
        ),
    );
  }

  Widget buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(Icons.notification_important, color: AppTheme.appColour),
          SizedBox(width: 16),
        ],
        leading: InkWell(
          child: Icon(Icons.person, color: AppTheme.appColour),
          onTap: () {
            //Navigator.pushNamed(context, PROFILE_SCREEN);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(widget.years)));
          },
        ),
        title: Text('CIELO',style: TextStyle(color: AppTheme.appColour,fontWeight: FontWeight.bold),),
        //title: FaIcon(FontAwesomeIcons.fire, color: Colors.deepOrange),
      );

  Widget buildUser(MatchesDetails user) {
    final userIndex = users.indexOf(user);
    final isUserInFocus = userIndex == users.length - 1;

    return Listener(
      onPointerMove: (pointerEvent) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.updatePosition(pointerEvent.localDelta.dx);
      },
      onPointerCancel: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      onPointerUp: (_) {
        final provider =
            Provider.of<FeedbackPositionProvider>(context, listen: false);
        provider.resetPosition();
      },
      child: Draggable(
        child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        feedback: Material(
          type: MaterialType.transparency,
          child: UserCardWidget(user: user, isUserInFocus: isUserInFocus),
        ),
        childWhenDragging: Container(),
        onDragEnd: (details) => onDragEnd(details, user),
      ),
    );
  }

  void onDragEnd(DraggableDetails details, MatchesDetails user) {
    final minimumDrag = 100;
    // if (details.offset.dx > minimumDrag) {
    //   user.isSwipedOff = true;
    // } else if (details.offset.dx < -minimumDrag) {
    //   user.isLiked = true;
    // }

    setState(() => users.remove(user));
  }
}
