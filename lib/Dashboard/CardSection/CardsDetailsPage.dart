

import 'package:astro_app/model/MatchesDetails.dart';
import 'package:astro_app/utils/AppImages.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/getAllMessageApi.dart';
import 'package:astro_app/utils/rest/api/getPreferenceApi.dart';
import 'package:astro_app/utils/rest/api/getSingleUserMessageApi.dart';
import 'package:astro_app/utils/rest/api/getUserDetailsApi.dart';
import 'package:astro_app/utils/rest/api/searchApi.dart';
import 'package:astro_app/utils/rest/api/sendMessageApi.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class DetailsPage extends StatefulWidget {

  final String image;
  final MatchesDetails matches;
  DetailsPage(this.image,this.matches);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String userId = '125';

  Future<String> sendMessage() async {
    bool responseBody = await SendMessageApi.sendMessage(userId);
    if (responseBody) {
      showToast("Messae has been sent", duration: 3);
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
    } else {
      showToast("Something went wrong, please try again!", duration: 3);
    }
  }

  double _width;
  double _height;

  String age = '21-25';
  int preference = 3;
  String seeking = 'M';
  int startLimit = 0;
  int endLimit = 1;

  Future<List> allPreferenceData;
  Future<List> getuserDetails;
  Future<List> getAllMmessage;
  Future<List> searchDetails;
  Future<List> getSingleUserMessageDetails;

  @override
  void initState() {
       allPreferenceData = PreferenceApi.getPreference();
       getuserDetails = GetUserDetailsApi.getUserDetails();
       getAllMmessage = GetAllMessageApi.getAllMessageApi();
       searchDetails = SearchApi.getSearchDetails(age, preference, seeking, startLimit, endLimit);
       getSingleUserMessageDetails = SingleUserMessageApi.getSingleUserMessageDetails(userId, startLimit, endLimit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    //print('xxx'+allPreferenceData['message']);
    final screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context, false);

    //we need to return a future
    return Future.value(false);
      },
          child: Scaffold(
        bottomNavigationBar: 
          FittedBox(
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _getIconButton(Icons.cut),
                        InkWell(
                          child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), color: AppTheme.appColour,border: Border.all(color: AppTheme.appColour)),
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text(
                            "Say Hi to ${widget.matches.name}",
                            style: TextStyle(fontSize: 17, color: AppTheme.white),//color: CustomTheme.textColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        onTap: () {
                          sendMessage();
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
                        },
                    ),
                        _getIconButton(Icons.favorite)
                      ],
                    ),
          ),
        body: Stack(
                children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  widget.matches.profileimage == null ?
                  ClipPath(
                    child: AppImages.getDetailsPageImage(250,screenWidth ,widget.image, widget.image)
                  ):
                  ClipPath(
                    child: AppImages.getDetailsPageImage(250,screenWidth ,widget.matches.profileimage, widget.matches.profileimage)
                  ),
                  SizedBox(height: 15,),
                  Text(
                    '${widget.matches.name}, 21',
                    style: TextStyle(
                      color: AppTheme.appColour,
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.matches.relationshipstatus == null ?
                      _getDetails('REATIONSHIP', 'Single') :
                      _getDetails('REATIONSHIP', widget.matches.relationshipstatus),
                      SizedBox(width: _width*0.31,),
                      _getDetails('ZODIAC SIGN', widget.matches.zodiac),
                    ],
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getDetails('SMOKING', 'Smoker'),
                      SizedBox(width: _width*0.38,),
                      _getDetails('DRINKING', 'Social')
                    ],
                  ),
                  Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _getDetails('DIET', 'Vegeterian'),
                        SizedBox(width: _width*0.32,),
                        _getDetails('WORKOUT', 'Sometimes')
                      ],
                    ),
                  // Expanded(
                  //   child: Align(
                  //     alignment: Alignment.centerRight,
                  //     child: Text("widget"),
                  //   ),
                  // ),
                  
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      myWidget('#Singing'),
                      myWidget('#StraightForward')
                    ],
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                        child: Container(
                        padding: EdgeInsets.symmetric(vertical: 16,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: AppTheme.appColour,border: Border.all(color: AppTheme.appColour)),
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Text(
                          "Astro Comment",
                          style: TextStyle(fontSize: 17, color: AppTheme.white),//color: CustomTheme.textColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        //sendMessage();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
                      },
                  ),
                  SizedBox(height: 10,),
                  // Row(mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     _getIconButton(Icons.cut),
                  //     InkWell(
                  //       child: Container(
                  //       padding: EdgeInsets.symmetric(vertical: 16,),
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10), color: AppTheme.appColour,border: Border.all(color: AppTheme.appColour)),
                  //       width: MediaQuery.of(context).size.width*0.5,
                  //       child: Text(
                  //         "Say Hi to piyush",
                  //         style: TextStyle(fontSize: 17, color: AppTheme.white),//color: CustomTheme.textColor),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       sendMessage();
                  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
                  //     },
                  // ),
                  //     _getIconButton(Icons.favorite)
                  //   ],
                  // )
                ],
              ),
            ),
            Positioned(
                top: 12,
                left: 12,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                ),
              )
          ],
        )
      ),
    );
  }

  Widget _getDetails(String text1, String text2) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,top: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1,textAlign: TextAlign.left,
            style: TextStyle(
              color: AppTheme.grey,
              fontSize: 14
            ),),
            SizedBox(height: 10,),
            Text(
              text2,textAlign: TextAlign.left,
              style: TextStyle(
                color: AppTheme.black,
                fontSize: 18
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myWidget(String text) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: myBoxDecoration(), //             <--- BoxDecoration here
    child: Text(
      text,
      style: TextStyle(fontSize: 18.0,color: AppTheme.appColour),
    ),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 3.0,color: AppTheme.appColour
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(30.0) //                 <--- border radius here
    ),
  );
}

Widget _getIconButton(IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, top: 6, right: 16),
    child: ClipOval(
      child: Material(
        color: AppTheme.appColour, // button color
        child: InkWell(
          splashColor: Colors.red, // inkwell color
          child: SizedBox(width: 56, height: 56, child: Icon(icon, color: AppTheme.white,)),
          onTap: () {},
        ),
      ),
    ),
  );
}

void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}