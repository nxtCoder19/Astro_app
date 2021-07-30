import 'package:astro_app/Signup/components/RelationshipStatusScreen.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/AppImages.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';

class SelectGenderScreen extends StatefulWidget {
  @override
  _SelectGenderScreenState createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {

  double _width;
  double _height;
  String gender = 'M';
  bool maleState = false;
  bool femaleState = false;

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
                  SizedBox(width: _width*0.2,height: 20,),
                  Text(
                    'Your Gender',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      decoration: TextDecoration.none
                    ),
                  )
                ],
              ),
              SizedBox(height: _height*0.1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Gender is Important for personalizing your relationship guide and well-being readings',
                  style: TextStyle(
                    fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration.none
                  ),
                ),
              ),
              SizedBox(height: _height*0.15,),
              
              Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          maleState = true;
                          femaleState = false;
                          gender = 'M';
                        });
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: _height*0.2,
                                width: _width*0.35,
                                child: AppImages.circularAssetImage(
                                    70, 'assets/images/default_male_image.png'),
                              ),
                            ),
                            Text('Male', style: TextStyle(
                              fontSize: 18,decoration: TextDecoration.none, 
                              color: maleState ? Colors.pink : Colors.white
                            ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('OR',style: TextStyle(
                        decoration: TextDecoration.none, color: Colors.white),),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                        femaleState = true;
                        maleState = false;
                        gender = 'F';
                        });
                      },
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: _height*0.2,
                                width: _width*0.35,
                                child: AppImages.circularAssetImage(
                                    70, 'assets/images/default_female_image.png'),
                              ),
                            ),
                            Text('Female', style: TextStyle(
                              fontSize: 18,decoration: TextDecoration.none, 
                              color: femaleState ? Colors.pink : Colors.white
                            ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),

                SizedBox(height: _height*0.2,),

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
                    // Navigator.pushNamed(context, RELATIONSHIP_STATUS_SCREEN,
                    // arguments: {'gender': gender}
                    // );
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RelationshipStatusScreen(gender)));
                  },
              ),

            ],
          ),
        ),
      ),
    );
  }
}