import 'package:astro_app/screens/chat/screens/home.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,backgroundColor: Colors.white,
          leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.appColour,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          title: Text('Messages',
          style: TextStyle(
            color: Colors.black
          ),),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                // getEducationOption(30, '', 'WHAT IS BITCOIN?', (){
                //   // Navigator.push(
                //   //   context,
                //   //   MaterialPageRoute(builder: (context) => BlockChainProjectScreen()),
                //   // );
                //   //Navigator.of(context).pushNamed(NEWSLETTER_CONFIRMATION_SCREEN);
                //   }),
                getEducationOption(30, 'How are you', 'john doe', (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }),
                getEducationOption(30, 'How are you', 'john doe', (){}),
                getEducationOption(30, 'How are you', 'john doe', (){}),
                getEducationOption(30, 'How are you', 'john doe', (){}),
                getEducationOption(30, 'How are you', 'john doe', (){}),
                getEducationOption(30, 'How are you', 'john doe', (){})
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getEducationOption(double size, String text1, String text, Function onPressed) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.appColour)
              )
            ),
            child: ClipRRect(
              child: Stack(
                children: <Widget>[
                  Container(color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_circle,color: AppTheme.appColour,size: 40,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(text1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,color: Colors.grey
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text("7:15 AM",
                              style: TextStyle(
                                fontSize: 18
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}