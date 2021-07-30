
import 'package:flutter/material.dart';

class MoodIcon extends StatelessWidget {
  //final String iconSrc;
  final Function press;
  final String text;
  final bool state;
  const MoodIcon({
    Key key,
    //this.iconSrc,
    this.press,
    this.text,
    this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(width: 120,height: 120,
          // margin: EdgeInsets.symmetric(horizontal: 10),
          // padding: EdgeInsets.all(60),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: state ? Colors.pink : Colors.white,
            ),
            //borderRadius: BorderRadius.all(20),
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: state ? Colors.pink : Colors.white,fontSize: 14
                ),
              ),
            ),
          // child: Image.asset(
          //   iconSrc,
          //   height: 20,
          //   width: 20,
          // ),
        ),
      ),
    );
  }
}
