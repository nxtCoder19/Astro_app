import 'package:flutter/material.dart';

class Button {
  static normal(String text, Function onTap) {
    return Builder(builder: (context) {
      return Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius:
              const BorderRadius.all(Radius.circular(4.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(4, 4),
                blurRadius: 8.0),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      );
    });
  }

  static raised(String text, Function onPressed) {
    return Builder(builder: (context) {
        return Container(
          child: RaisedButton(
            textColor: Colors.white,
            child: Text(text),
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
          )
        );
    },);
  }

   static text(String text, Function onPressed,{Widget w}) {
    return Builder(builder: (context) {
        return Container(
          child: InkWell(
           child: w == null ? Text(text) : w,
            onTap: onPressed,
          )
      );
    },);
  }

  static raisedLogin(String text,Function onPressed, {Widget w}){
    return Builder(builder: (context) {
      return Container(
        width: double.infinity,
        height: 60.0,
        child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            textColor: Colors.white,
            child: w == null ? Text(text,style: TextStyle(fontSize: 20),) : w,
            color: Theme.of(context).primaryColor,
            onPressed: onPressed,
          )
      );
    },);
  }

  static rounded(String text, Function onTap) {
    return Builder(builder: (context) {
      return new InkWell(
          child: new Container(
            height: 32,
            width: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(32)),
            alignment: Alignment.center,
            child: new Text(
              text,
              style:
                new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          onTap: onTap
        );
    },);
  }
}