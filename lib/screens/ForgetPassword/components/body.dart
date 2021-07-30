import 'package:astro_app/screens/ForgetPassword/components/background.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "FORGOT PASSWORD",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            // SizedBox(height: size.height * 0.03),
            // Image.asset(
            //   "assets/images/f1.png",
            //   width: size.width * 0.55,
            // ),
            // SizedBox(height: size.height * 0.03),
            // Text(
            //   "To recover your password you need to enter ",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            // //SizedBox(height: size.height * 0.03),
            // Text(
            //   "Your registered email address.",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  //controller: userNameController,
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
            SizedBox(height: size.height * 0.03),
            // RoundedInputField(
            //   hintText: "Your Email",
            //   onChanged: (value) {},
            // ),
            InkWell(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text(
                    "RESET",
                    style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                },
            ),
            // RoundedButton(
            //   text: "SEND",
            //   press: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
