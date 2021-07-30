import 'package:astro_app/Otp/widgets/body.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  OtpVerificationScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()
    );
  }
}