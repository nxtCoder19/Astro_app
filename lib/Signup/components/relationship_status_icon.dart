import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RelationshipStatusIcon extends StatelessWidget {
  final IconData iconSrc;
  final Function press;
  final String text;
  final bool state;
  const RelationshipStatusIcon({
    Key key,
    this.iconSrc,
    this.press,
    this.text,
    this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
              children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(iconSrc,color: Colors.white,size: 25,),
            // child: Image.asset(
            //   iconSrc,
            //   height: 20,
            //   width: 20,
            // ),
          ),
          Text(text, style: TextStyle(
                  fontSize: 18,decoration: TextDecoration.none, 
                  color: state ? Colors.pink : Colors.white
              ))
        ],
      ),
    );
  }
}
