import 'package:astro_app/Dashboard/Profile/components/MoodSelectionScreen.dart';
import 'package:astro_app/Signup/SignUpDetails.dart';
import 'package:astro_app/Signup/components/PlaceOfBirthScreen.dart';
import 'package:astro_app/Signup/components/relationship_status_icon.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MaximumAgeScreen extends StatefulWidget {

  @override
  _MaximumAgeScreenState createState() => _MaximumAgeScreenState();
}

class _MaximumAgeScreenState extends State<MaximumAgeScreen> {

  double _width;
  double _height;
  double years = 18.0;
  String _date = "Not set";
  String _time = "set your time of birth";

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
                    'Maximum Age',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: _height*0.05,),
              Image.asset(
                'assets/images/age.png',height: _height*0.3,
              ),
              SizedBox(height: _height*0.05,),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  'Enter maximum age to find matches according to age',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.none
                  ),
                ),
              ),
                SizedBox(height: _height*0.05,),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        yearRange(),
                        // RaisedButton(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(5.0)),
                        //   elevation: 4.0,
                        //   onPressed: () {
                        //     DatePicker.showDatePicker(context,
                        //         theme: DatePickerTheme(
                        //           containerHeight: 210.0,
                        //         ),
                        //         showTitleActions: true,
                        //         minTime: DateTime(2000, 1, 1),
                        //         maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        //       print('confirm $date');
                        //       _date = '${date.year} - ${date.month} - ${date.day}';
                        //       setState(() {});
                        //     }, currentTime: DateTime.now(), locale: LocaleType.en);
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     height: 50.0,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: <Widget>[
                        //         Row(
                        //           children: <Widget>[
                        //             Container(
                        //               child: Row(
                        //                 children: <Widget>[
                        //                   Icon(
                        //                     Icons.date_range,
                        //                     size: 18.0,
                        //                     color: AppTheme.appColour,
                        //                   ),
                        //                   Text(
                        //                     " $_date",
                        //                     style: TextStyle(
                        //                         color: AppTheme.appColour,
                        //                         fontWeight: FontWeight.bold,
                        //                         fontSize: 18.0),
                        //                   ),
                        //                 ],
                        //               ),
                        //             )
                        //           ],
                        //         ),
                        //         Text(
                        //           "  Change",
                        //           style: TextStyle(
                        //               color: AppTheme.appColour,
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 18.0),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   color: Colors.white,
                        // ),
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                        // FittedBox(
                        //                           child: RaisedButton(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(5.0)),
                        //     elevation: 4.0,
                        //     onPressed: () {
                        //       DatePicker.showTimePicker(context,
                        //           theme: DatePickerTheme(
                        //             containerHeight: 300.0,
                        //           ),
                        //           showTitleActions: true, onConfirm: (time) {
                        //         print('confirm $time');
                        //         _time = '${time.hour} : ${time.minute} : ${time.second}';
                        //         setState(() {});
                        //       }, currentTime: DateTime.now(), locale: LocaleType.en);
                        //       setState(() {});
                        //     },
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       height: 60.0,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Row(
                        //             children: <Widget>[
                        //               Container(
                        //                 child: Row(
                        //                   children: <Widget>[
                        //                     Icon(
                        //                       Icons.access_time,
                        //                       size: 18.0,
                        //                       color: AppTheme.appColour,
                        //                     ),
                        //                     Text(
                        //                       " $_time",
                        //                       style: TextStyle(
                        //                           color: AppTheme.appColour,
                        //                           fontWeight: FontWeight.bold,
                        //                           fontSize: 18.0),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //           Text(
                        //             "  Change",
                        //             style: TextStyle(
                        //                 color: AppTheme.appColour,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 18.0),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     color: Colors.white,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: _height*0.15,),

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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MoodSelectionScreen(years.toString().substring(0,2))));
                    //Navigator.pushNamed(context, PLACE_OF_BIRTH_SCREEN);
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceOfBirthScreen(widget.gender, widget.dateOfBirth,widget.relationshipstatus)));
                  },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget yearRange() {
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
                "Maximum Year",
                style: TextStyle(
                    color: AppTheme.appColour,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${years.round()} years.",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Slider(
            value: years,
            onChanged: (newyears) {
              setState(() {
                years = newyears;
              });
            },
            min: 18,
            max: 75,
            activeColor: AppTheme.appColour,
          )
        ],
      ),
    );
  }

}