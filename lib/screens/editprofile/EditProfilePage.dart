import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/editprofileApi.dart';
import 'package:astro_app/utils/rest/api/userApi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
//import './gridview_photos.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSwitched = true;

  var professionController = TextEditingController();
  var hobbiesController = TextEditingController();
  String instagramAccount = '1234';
  String spotiyAccount = '12';

  Future<String> editProfile() async {
    bool responseBody = await EditProfileApi.editProfile(professionController.text,
                                                        hobbiesController.text,
                                                        instagramAccount, spotiyAccount);
    if (responseBody) {
      showToast("Your change has been saved", duration: 3);
      //Navigator.popAndPushNamed(context, PROFILE_SCREEN);
    } else {
      
      showToast("Something went wrong, please try again!", duration: 3);
    }
  }

  Widget smartPhotos() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Smart Photos",
            style: TextStyle(
                color: AppTheme.appColour,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeTrackColor: Colors.red[100],
            activeColor: AppTheme.appColour,
          ),
        ],
      ),
    );
  }

  Widget headingsForTextField({
    text,
    left,
    top,
    right,
    bottom,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget textField({hintText, left, right, top, bottom}) {
    return TextField(
      maxLength: 500,
      style: TextStyle(
          //color: Colors.white
          ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
          isDense: true,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
          //border: InputBorder.none
          ),
    );
  }

  Widget textField1({hintText, left, right, top, bottom, controller}) {
    return TextField(
      controller: controller,
      style: TextStyle(
          //color: Colors.white
          ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
          isDense: true,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
          //border: InputBorder.none
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,centerTitle: true,
        actions: [
          InkWell(
            child: Icon(Icons.check, color: AppTheme.appColour),
            onTap: () {
              editProfile();
            },
          ),
          SizedBox(width: 16),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.appColour,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Edit profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: ListView(
          children: <Widget>[
            //GridViewForPhotos(),
            // smartPhotos(),
            // Container(
            //   padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            //   child: Text(
            //     "Smart Photos Contibuesly test all your profile photos to find the best one",
            //     style: TextStyle(color: Colors.grey[500], fontSize: 16),
            //   ),
            // ),
            headingsForTextField(
              text: "About Piyush Chaubey",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 14.0,
            ),
            textField(
              hintText: "About You",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 24.0,
            ),
            headingsForTextField(
              text: "Job title",
              left: 16.0,
              top: 0.0,
              right: 16.0,
              bottom: 4.0,
            ),
            textField1(
              hintText: "Add Job Title",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            headingsForTextField(
              text: "Company",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 4.0,
            ),
            textField1(
              hintText: "Add Company",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            headingsForTextField(
              text: "Profession",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 4.0,
            ),
            textField1(
              hintText: "Add Profession",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
              controller: professionController
            ),
            headingsForTextField(
              text: "Hobbies",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 4.0,
            ),
            textField1(
              hintText: "Add Hobbies",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
              controller: hobbiesController
            ),
            // headingsForTextField(
            //   text: "Showing my instagram Photos",
            //   left: 16.0,
            //   top: 16.0,
            //   right: 16.0,
            //   bottom: 4.0,
            // ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "Match INSTAGRAM Account",
                style: TextStyle(
                    color: AppTheme.appColour,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "Add my SPOTIFY Account",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            headingsForTextField(
              text: "I am ",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 4.0,
            ),
            textField1(
              hintText: "Man",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            headingsForTextField(
              text: "Looking for",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 4.0,
            ),
            textField1(
              hintText: "Add Sexual Orientation",
              left: 16.0,
              top: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            SizedBox(height: 20,),
            // InkWell(
            //   child: Container(
            //       padding: EdgeInsets.symmetric(vertical: 16,),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10), color: AppTheme.white,border: Border.all(color: AppTheme.appColour)),
            //       width: MediaQuery.of(context).size.width*0.8,
            //       child: Text(
            //         "Save Change",
            //         style: TextStyle(fontSize: 17, color: AppTheme.appColour),//color: CustomTheme.textColor),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //     onTap: () {
            //       editProfile();
            //      // Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
            //     },
            // ),
            // SizedBox(height: 20,),
            // headingsForTextField(
            //   text: "Control Your Profile",
            //   left: 16.0,
            //   top: 16.0,
            //   right: 16.0,
            //   bottom: 4.0,
            // ),
            // smartPhotos(),
            // smartPhotos(),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
