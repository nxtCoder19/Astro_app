import 'package:astro_app/Signup/SignUpDetails.dart';
import 'package:astro_app/Signup/components/PlaceOfBirthScreen.dart';
import 'package:astro_app/Signup/components/TimeOfBirthScreen.dart';
import 'package:astro_app/Signup/components/relationship_status_icon.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOfBirthScreen extends StatefulWidget {

  String gender;
  String relationshipstatus;
  DateOfBirthScreen(this.gender, this.relationshipstatus);

  @override
  _DateOfBirthScreenState createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {

  double _width;
  double _height;
  String dateOfBirth = '1969-01-01';

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(width: 30,height: 20,),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,color: Colors.white,
                    ),
                  ),
                  SizedBox(width: _width*0.23,height: 20,),
                  Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/images/timeofbirth.png',height: _height*0.3,
              ),
              SizedBox(height: _height*0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Time is important for determining your ascendant, houses, and moon position',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.none
                  ),
                ),
              ),
              // SizedBox(height: _height*0.05,),
              // Container(
              //   child: CupertinoTimerPicker(
              //     mode: CupertinoTimerPickerMode.hm,
              //     onTimerDurationChanged: (data) {
              //       print(data);
              //     }
              //   ),
              // ),
              SizedBox(height: _height*0.05,),
               Container(
                height: _height*0.3,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                        brightness: Brightness.dark,
                    ),
                    child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime(1969, 1, 1),
                    onDateTimeChanged: (DateTime newDateTime) {
                      dateOfBirth = newDateTime.toString();
                      //print("completed"+dateOfBirth);
                      // Do something
                    },
                  ),
                ),
              ),
                SizedBox(height: _height*0.05,),

                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: AppTheme.white),
                    width: MediaQuery.of(context).size.width*0.9,
                    child: Text(
                      "NEXT",
                      style: TextStyle(fontSize: 17, color: AppTheme.appColour,decoration: TextDecoration.none),//color: CustomTheme.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () {
                    //Navigator.pushNamed(context, PLACE_OF_BIRTH_SCREEN);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TimeOfBirthScreen(widget.gender, dateOfBirth, widget.relationshipstatus)));
                  },
              ),

            ],
          ),
        ),
      ),
    );
  }
}