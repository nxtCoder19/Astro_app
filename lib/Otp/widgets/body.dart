import 'package:astro_app/Otp/widgets/background.dart';
import 'package:astro_app/Signup/components/select_gender_screen.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/userApi.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:toast/toast.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String otp = '';

  Future<String> otpVerification() async {
    print('xxx');
    print(otp);
    bool responseBody = await userApi.otpVerification(otp);
    if (responseBody) {
      Navigator.pushNamed(context, SELECT_GENDER_SCREEN);
    } else {
      showToast("Something went wrong, please try again!", duration: 3);
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
            Image.asset(
              "assets/images/otp-banner-image.png",
              width: size.width * 0.55,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "OTP Verification",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Otp has been sent to your email id",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: size.height * 0.03),
            Text(
              "Enter your OTP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            OTPTextField(
          length: 6,keyboardType: TextInputType.emailAddress,
          width: MediaQuery.of(context).size.width,
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldWidth: 50,
          fieldStyle: FieldStyle.underline,
          style: TextStyle(
            fontSize: 17
          ),
          onCompleted: (pin) {
            print("Completed: " + pin);
            otp = pin;
          },
        ),
            SizedBox(height: 40,),
            InkWell(
                          child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  otpVerification();
                  //Navigator.pushNamed(context, SELECT_GENDER_SCREEN);
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectGenderScreen()));
                },
            ),
            SizedBox(height: 25,),
            Center(
              child: Text(
                'Resend Otp',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.appColour
                ),
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
