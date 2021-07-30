import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final String text;
  final Function press;
  const SocalIcon({
    Key key,
    this.iconSrc,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
        width: MediaQuery.of(context).size.width*0.9,
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconSrc, width: 30,height: 30,
            ),
            SizedBox(width: 5,),
            Text(
              text,
              style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
