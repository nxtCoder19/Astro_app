import 'package:astro_app/Login/login_screen.dart';
import 'package:astro_app/Otp/index.dart';
import 'package:astro_app/Signup/SignUpDetails.dart';
import 'package:astro_app/Signup/components/background.dart';
import 'package:astro_app/Signup/components/or_divider.dart';
import 'package:astro_app/Signup/components/select_gender_screen.dart';
import 'package:astro_app/Signup/components/social_icon.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/userApi.dart';
import 'package:astro_app/utils/rest/response.dart';
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
  bool valuefirst = false;  
  final formKey = GlobalKey<FormState>();

  Future<String> requestOtp() async {
    bool responseBody = await userApi.sendOtpRequest(emailController.text, passwordController.text);
    if (responseBody) {
      Navigator.pushNamed(context, OTP_SCREEN);
    } else {
      showToast("You have already used this email id!", duration: 3);
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
              "Sign-Up Cielo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Take a wish upon a star with CIELO",
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: size.height * 0.02),
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
                  requestOtp();
                  //Navigator.pushNamed(context, OTP_SCREEN);
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerificationScreen()));
                },
            ),
            OrDivider(),
            SocalIcon(
              iconSrc: "assets/images/facebookIcon.png",
              text: "Continue with Facebook",
            ),
            SizedBox(height: size.height * 0.03),
            SocalIcon(
              iconSrc: "assets/images/gmail.png",
              text: "Continue with Gmail",
            ),
            SizedBox(height: size.height * 0.03),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, LOGIN);
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Text.rich(
                      TextSpan(
                        text: 'Alreday ave an account',
                        children: [
                          TextSpan(
                            text: ' Login',
                            style: TextStyle(
                              color: AppTheme.appColour,
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
            SizedBox(height: size.height * 0.01),
            
            Row(
              children: [
                Checkbox(  
                    checkColor: Colors.greenAccent,  
                    activeColor: AppTheme.appColour,  
                    value: this.valuefirst,  
                    onChanged: (bool value) {  
                      setState(() {  
                        this.valuefirst = value;  
                      });  
                    },  
                  ), 
                Flexible(
                  child: Text(
                    'By continuing, you agree that you have read and accepted our T&C and Privacy Policy',
                    style: TextStyle(color: Colors.grey),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ],
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
