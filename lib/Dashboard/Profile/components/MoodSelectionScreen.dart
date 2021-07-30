import 'package:astro_app/Dashboard/CardSection/CardSectionAlignment.dart';
import 'package:astro_app/Dashboard/Profile/components/mood_icon.dart';
import 'package:astro_app/Dashboard/tinderCard/page/home_page.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/moodApi.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MoodSelectionScreen extends StatefulWidget {

  String years;

  MoodSelectionScreen(this.years);

  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {

  double _width;
  double _height;
  String moodSelection = '';
  int preference;
  bool emotionalState = false;
  bool longtermState = false;
  bool chemistryState = false;
  bool intellectualState = false;
  bool randomState = false;

  Future<String> matchesWithMoodSelection() async {
    bool responseBody = await MoodApi.getmoodSelection(moodSelection);
    if (responseBody) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(widget.years, preference)));
    } else {
      showToast("Something went wrong, please try again!", duration: 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    print(widget.years.substring(0,2));
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: AppTheme.appColour,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "Mood selection",
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9
                ],
                    colors: [
                  Color(0xFF3594DD),
                Color(0xFF4569DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0)
                ])),
        child: Stack(
          children: [
            // Positioned(
            //   left: _width*0.32,top: _height*0.32,
            //   child: MoodIcon(text: 'Wish me luck', press: () {
            //     setState(() {
            //       emotionalState = false;
            //       longtermState = false;
            //       chemistryState = false;
            //       intellectualState = false;
            //       randomState = true;
            //       moodSelection = 'Random';
            //     });
            //   },state: randomState,)
            // ),
            Column(
              children: [
                SizedBox(width: 30,height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,color: Colors.white,
                    ),
                  ),
                  SizedBox(width: _width*0.20,height: 20,),
                  Text(
                    'Mood Selection',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
                SizedBox(height: _height*0.11,),
                FittedBox(
                                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MoodIcon(text: 'EMOTION',press: () {
                        setState(() {
                          emotionalState = true;
                          longtermState = false;
                          chemistryState = false;
                          intellectualState = false;
                          randomState = false;
                          moodSelection = 'Emotional';
                          preference = 1;
                        });
                      },state: emotionalState,),
                      SizedBox(width: _width*0.3,),
                      MoodIcon(text: 'LONG-TERM',press: () {
                        setState(() {
                          emotionalState = false;
                          longtermState = true;
                          chemistryState = false;
                          intellectualState = false;
                          randomState = false;
                          moodSelection = 'Longterm';
                          preference = 2;
                        });
                      },state: longtermState,)
                    ],
                  ),
                ),
                SizedBox(height: _height*0.05,),
                FittedBox(
                                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MoodIcon(text: 'CHEMISTRY',press: () {
                        setState(() {
                          emotionalState = false;
                          longtermState = false;
                          chemistryState = true;
                          intellectualState = false;
                          randomState = false;
                          moodSelection = 'Chemistry';
                          preference = 3;
                        });
                      },state: chemistryState,),
                      SizedBox(width: _width*0.3,),
                      MoodIcon(text: 'INTELLECTUAL',press: () {
                        setState(() {
                          emotionalState = false;
                          longtermState = false;
                          chemistryState = false;
                          intellectualState = true;
                          randomState = false;
                          moodSelection = 'Intellectual';
                          preference = 4;
                        });
                      },state: intellectualState,)
                    ],
                  ),
                ),
                MoodIcon(text: 'WISH ME LUCK', press: () {
                setState(() {
                  emotionalState = false;
                  longtermState = false;
                  chemistryState = false;
                  intellectualState = false;
                  randomState = true;
                  moodSelection = 'Random';
                  preference = 5;
                });
              },state: randomState,),
                SizedBox(height: _height*0.05,),
                // Row(
                //   //mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     MoodIcon(text: 'EMOTIONAL',press: () {},),
                //     SizedBox(width: _width*0.3,),
                //     MoodIcon(text: 'RANDOM',press: () {},)
                //   ],
                // ),
                SizedBox(height: _height*0.1,),
                
              ],
            ),
            Positioned(
              bottom: 20,left: 15,
              child: InkWell(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: AppTheme.white),
                      width: MediaQuery.of(context).size.width*0.9,
                      child: Text(
                        "Go To Matches",
                        style: TextStyle(fontSize: 17, color: AppTheme.appColour),//color: CustomTheme.textColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      matchesWithMoodSelection();
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
                    },
                ),
            )
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}