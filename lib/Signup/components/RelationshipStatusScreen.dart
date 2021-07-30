import 'package:astro_app/Signup/components/DateOfBirthScreen.dart';
import 'package:astro_app/Signup/components/relationship_status_icon.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';

class RelationshipStatusScreen extends StatefulWidget {

  String gender;
  RelationshipStatusScreen(this.gender);

  @override
  _RelationshipStatusScreenState createState() => _RelationshipStatusScreenState();
}

class _RelationshipStatusScreenState extends State<RelationshipStatusScreen> {

  double _width;
  double _height;
  String relationshipStatus = '';
  bool singleState = false;
  bool inrelationshipState = false;
  bool marriagedState = false;
  bool divorcedState = false;
  bool engagedState = false;
  bool complicatedState = false;

  @override
  Widget build(BuildContext context) {
    // print('aa');
    // print(widget.gender);
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
                  SizedBox(width: _width*0.2,height: 20,),
                  Text(
                    'Relationship status',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: _height*0.1,),
              FittedBox(
                              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'We need more details to make sure your',
                    style: TextStyle(
                      fontSize: 18,
                          color: Colors.white,
                          decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'your horcoscope is accurate',
                  style: TextStyle(
                    fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.none
                  ),
                ),
              ),

              SizedBox(height: _height*0.05,),

              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RelationshipStatusIcon(iconSrc: Icons.single_bed,press: (){
                    setState(() {
                      singleState = true;
                      inrelationshipState = false;
                      marriagedState = false;
                      divorcedState = false;
                      engagedState = false;
                      complicatedState = false;
                      relationshipStatus = 'Single';
                    });
                  },text: 'Single',state: singleState,),
                  SizedBox(width: _width*0.1,),
                  RelationshipStatusIcon(iconSrc: Icons.list_alt_outlined,press: (){
                    setState(() {
                      singleState = false;
                      inrelationshipState = true;
                      marriagedState = false;
                      divorcedState = false;
                      engagedState = false;
                      complicatedState = false;
                      relationshipStatus = 'In relationship';
                    });
                  },text: 'In relationship',state: inrelationshipState,),
                ],
              ),

              SizedBox(height: _height*0.03,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RelationshipStatusIcon(iconSrc: Icons.mark_chat_read,press: (){
                    setState(() {
                      singleState = false;
                      inrelationshipState = false;
                      marriagedState = true;
                      divorcedState = false;
                      engagedState = false;
                      complicatedState = false;
                      relationshipStatus = 'Married';
                    });
                  },text: 'Married',state: marriagedState,),
                  SizedBox(width: _width*0.15,),
                  RelationshipStatusIcon(iconSrc: Icons.drive_eta_sharp,press: (){
                    setState(() {
                      singleState = false;
                      inrelationshipState = false;
                      marriagedState = false;
                      divorcedState = true;
                      engagedState = false;
                      complicatedState = false;
                      relationshipStatus = 'Divorced';
                    });
                  },text: 'Divorced',state: divorcedState,),
                ],
              ),

              SizedBox(height: _height*0.03,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RelationshipStatusIcon(iconSrc: Icons.engineering_sharp,press: (){
                    setState(() {
                      singleState = false;
                      inrelationshipState = false;
                      marriagedState = false;
                      divorcedState = false;
                      engagedState = true;
                      complicatedState = false;
                      relationshipStatus = 'Engaged';
                    });
                  },text: 'Engaged',state: engagedState,),
                  SizedBox(width: _width*0.14,),
                  RelationshipStatusIcon(iconSrc: Icons.compass_calibration,press: (){
                    setState(() {
                      singleState = false;
                      inrelationshipState = false;
                      marriagedState = false;
                      divorcedState = false;
                      engagedState = false;
                      complicatedState = true;
                      relationshipStatus = 'Complicated';
                    });
                  },text: 'Complicated',state: complicatedState,),
                ],
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
                    // Navigator.pushNamed(
                    //   context, 
                    //   TIME_OF_BIRTH_SCREEN,);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DateOfBirthScreen(widget.gender, relationshipStatus)));
                  },
              ),

            ],
          ),
        ),
      ),
    );
  }
}