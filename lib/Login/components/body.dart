import 'package:astro_app/Dashboard/CardSection/CardSectionAlignment.dart';
import 'package:astro_app/Dashboard/swipeCard/SwipeAnimation/index.dart';
import 'package:astro_app/Dashboard/tinderCard/page/home_page.dart';
import 'package:astro_app/Login/components/background.dart';
import 'package:astro_app/Signup/SignUpDetails.dart';
import 'package:astro_app/Signup/components/or_divider.dart';
import 'package:astro_app/Signup/components/social_icon.dart';
import 'package:astro_app/Signup/index.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/screens/ForgetPassword/forget_password_screen.dart';
import 'package:astro_app/screens/maximumAge/MaximumAgeScreen.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/userApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toast/toast.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<String> requestLogin() async {
    bool responseBody = await userApi.loginRequest(emailController.text, passwordController.text);
    if (responseBody) {
      //Navigator.pushNamed(context, HOME_PAGE);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MaximumAgeScreen()));
    } else {
      showToast("You need to Sign Up first !", duration: 3);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset('assets/images/logo 12.jpg',height: size.height * 0.15,),
            SizedBox(height: size.height * 0.03),
            Text(
              "Log in",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Waiting for you under the stars",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Icon(Icons.email),
                              )),
                          onEditingComplete: () {},
                          onSaved: (value) {}),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              icon: Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Icon(Icons.remove_red_eye),
                              )),
                          onEditingComplete: () {},
                          onSaved: (value) {}),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            SizedBox(height: size.height * 0.03),
            InkWell(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text(
                    "Let the stars match you",
                    style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  requestLogin();
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                },
            ),
            OrDivider(),
            SocalIcon(
              iconSrc: "assets/images/facebookIcon.png",
              text: "Login with Facebook",
            ),
            SizedBox(height: size.height * 0.03),
            SocalIcon(
              iconSrc: "assets/images/gmail.png",
              text: "Login with Google",
            ),
            SizedBox(height: size.height * 0.03),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
              },
              child: Text(
                'Forget Password',
                style: TextStyle(
                  color: AppTheme.appColour
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
