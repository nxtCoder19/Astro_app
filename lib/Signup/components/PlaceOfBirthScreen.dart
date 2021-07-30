import 'package:astro_app/Signup/SignUpDetails.dart';
import 'package:astro_app/Signup/components/relationship_status_icon.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceOfBirthScreen extends StatefulWidget {

  String gender;
  String dateOfBirth;
  String relationshipstatus;
  PlaceOfBirthScreen(this.gender, this.dateOfBirth, this.relationshipstatus);

  @override
  _PlaceOfBirthScreenState createState() => _PlaceOfBirthScreenState();
}

class _PlaceOfBirthScreenState extends State<PlaceOfBirthScreen> {

  double _width;
  double _height;
  var countryController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print('zz');
    // print(widget.gender);
     print(widget.dateOfBirth);
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
          child: SingleChildScrollView(
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
                      'Place of Birth',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        decoration: TextDecoration.none
                      ),
                    )
                  ],
                ),
                Image.asset(
                  'assets/images/birthPlace.png',width: _width*0.5,height: _height*0.3,
                ),
                SizedBox(height: _height*0.05,),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Time is important for determining your ascendant, houses, and moon position',
                    style: TextStyle(
                      fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.none
                    ),
                  ),
                ),
                SizedBox(height: _height*0.05,),
                TextFormField(cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                  controller: cityController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        ), 
                      labelText: 'Enter Your City of Birth',labelStyle: TextStyle(color: Colors.white),
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Icon(Icons.location_city,size: 40,color: Colors.white,),
                      )),
                  onEditingComplete: () {},
                  onSaved: (value) {}),

                SizedBox(height: _height*0.05,),
                TextFormField(cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                  controller: countryController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.white),   
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        ), 
                      labelText: 'Enter Your Country of Birth',
                      labelStyle: TextStyle(color: Colors.white),
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Icon(Icons.gps_fixed,size: 40,color: Colors.white,),
                      )),
                  onEditingComplete: () {},
                  onSaved: (value) {}),
                //  Container(
                //   height: 250,
                //   child: CupertinoDatePicker(
                //     mode: CupertinoDatePickerMode.date,
                //     initialDateTime: DateTime(1969, 1, 1),
                //     onDateTimeChanged: (DateTime newDateTime) {
                //       // Do something
                //     },
                //   ),
                // ),
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
                      //Navigator.pushNamed(context, ADD_MORE_INFO_SCREEN);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpDetailsScreen(
                        widget.gender,
                        widget.dateOfBirth,
                        widget.relationshipstatus,
                        cityController.text,
                        countryController.text
                      )));
                    },
                ),

                SizedBox(height: _height*0.05,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}