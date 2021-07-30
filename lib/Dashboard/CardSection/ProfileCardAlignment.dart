

import 'package:astro_app/Dashboard/CardSection/CardsDetailsPage.dart';
import 'package:astro_app/constants/constants.dart';
import 'package:astro_app/utils/AppImages.dart';
import 'package:flutter/material.dart';

class ProfileCardAlignment extends StatelessWidget {
  final int cardNum;
  final String img;

  ProfileCardAlignment(this.cardNum,this.img);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.pushNamed(context, MATCHES_DETAILS_SCREEN);
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage()));

    },
          child: new Card(
        child: new Stack(
          children: <Widget>[
            new SizedBox.expand(
              child: new Material(
                borderRadius: new BorderRadius.circular(12.0),
                child: AppImages.getImage(img, defaultMatchesImage),
                //child: new Image.asset('assets/images/portrait.jpeg', fit: BoxFit.cover),
              ),
            ),
            new SizedBox.expand(
              child: new Container(
                decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.center,
                        end: Alignment.bottomCenter)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Positioned(
                child: Column(
                  children: [
                    new Text('Piyush Chaubey, 21',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700)),
                    new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
                    new Text('Banglore, karnatka',
                        textAlign: TextAlign.start,
                        style: new TextStyle(color: Colors.white)),
                  ],
                )
              ),
            ),
            // new Align(
            //   alignment: Alignment.topLeft,
            //   child: new Container(
            //       padding:
            //           new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            //       child: new Column(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           new Text('Card number $cardNum',
            //               style: new TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20.0,
            //                   fontWeight: FontWeight.w700)),
            //           new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
            //           new Text('A short description.',
            //               textAlign: TextAlign.start,
            //               style: new TextStyle(color: Colors.white)),
            //         ],
            //       )),
            // ),

            // new Align(
            //   alignment: Alignment.topRight,
            //   child: new Container(
            //       padding:
            //           new EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            //       child: new Column(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           new Text('Say Hi',
            //               style: new TextStyle(
            //                   color: Colors.white,
            //                   fontSize: 20.0,
            //                   fontWeight: FontWeight.w700)),
            //           // new Padding(padding: new EdgeInsets.only(bottom: 8.0)),
            //           // new Text('A short description.',
            //           //     textAlign: TextAlign.start,
            //           //     style: new TextStyle(color: Colors.white)),
            //         ],
            //       )),
            // ),
            //Positioned(top: 52,left: 20,child: Text('hii'))
          ],
        ),
      ),
    );
  }
}
