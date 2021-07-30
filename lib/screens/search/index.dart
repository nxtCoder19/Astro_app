import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum BORDER_STATE { DEFAULT_BORDER, ONCLICK_BORDER }

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  BORDER_STATE borderStateFirst = BORDER_STATE.DEFAULT_BORDER;
  BORDER_STATE borderStateSecond = BORDER_STATE.DEFAULT_BORDER;
  BORDER_STATE borderStateThird = BORDER_STATE.DEFAULT_BORDER;
  BORDER_STATE borderStateFourth = BORDER_STATE.DEFAULT_BORDER;
  bool _onPressFirst = true;
  bool _onPressSecond = true;
  bool _onPressThird = true;
  bool _onPressFourth = true;

  BoxDecoration borderColourFirst() {
    switch(borderStateFirst){
      case BORDER_STATE.DEFAULT_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.grey),
        );
      
      case BORDER_STATE.ONCLICK_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.appColour, width:5),
        );
    }
  }

  BoxDecoration borderColourSecond() {
    switch(borderStateSecond){
      case BORDER_STATE.DEFAULT_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.grey),
        );
      
      case BORDER_STATE.ONCLICK_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.appColour, width:5),
        );
    }
  }

  BoxDecoration borderColourThird() {
    switch(borderStateThird){
      case BORDER_STATE.DEFAULT_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.grey),
        );
      
      case BORDER_STATE.ONCLICK_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.appColour, width:5),
        );
    }
  }

  BoxDecoration borderColourFourth() {
    switch(borderStateFourth){
      case BORDER_STATE.DEFAULT_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.grey),
        );
      
      case BORDER_STATE.ONCLICK_BORDER:
        return BoxDecoration(
          border: Border.all(color: AppTheme.appColour, width:5),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.appColour,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Search",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
        child: Column(
          children: [
            _getAgeDetails('18', '70'),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                //controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(fillColor: AppTheme.white,
                  enabledBorder: new OutlineInputBorder(
                    borderSide: new BorderSide(color: AppTheme.appColour)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.appColour)),
                    labelText: 'Anywhere in India',labelStyle: TextStyle(color: AppTheme.appColour),
                    suffixIcon: const Icon(
                      Icons.search, color: AppTheme.appColour,
                    )
                    // icon: Padding(
                    //   padding: const EdgeInsets.only(top: 14),
                    //   //child: Icon(LineIcons.search),
                    // )
                  ),
                onEditingComplete: () {},
                onSaved: (value) {}),
            ),
            SizedBox(height: 10,),
            Text(
              'Show me',
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 10,),
            FittedBox(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myFirstWidget(
                    _onPressFirst
                    ? () {
                      setState(() {
                        _onPressFirst = false;
                        borderStateFirst = BORDER_STATE.ONCLICK_BORDER;
                      });
                    }
                    : () {
                      setState(() {
                        _onPressFirst = true;
                        borderStateFirst = BORDER_STATE.DEFAULT_BORDER;
                      });
                    }
                  ),
                  mySecondWidget(
                    _onPressSecond
                    ? () {
                      setState(() {
                        _onPressSecond = false;
                        borderStateSecond = BORDER_STATE.ONCLICK_BORDER;
                      });
                    }
                    : () {
                      setState(() {
                        _onPressSecond = true;
                        borderStateSecond = BORDER_STATE.DEFAULT_BORDER;
                      });
                    }
                  )
                ],
              ),
            ),
            FittedBox(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myThirdWidget(
                    _onPressThird
                    ? () {
                      setState(() {
                        _onPressThird = false;
                        borderStateThird = BORDER_STATE.ONCLICK_BORDER;
                      });
                    }
                    : () {
                      setState(() {
                        _onPressThird = true;
                        borderStateThird = BORDER_STATE.DEFAULT_BORDER;
                      });
                    }
                  ),
                  myFourthWidget(
                    _onPressFourth
                    ? () {
                      setState(() {
                        _onPressFourth = false;
                        borderStateFourth = BORDER_STATE.ONCLICK_BORDER;
                      });
                    }
                    : () {
                      setState(() {
                        _onPressFourth = true;
                        borderStateFourth = BORDER_STATE.DEFAULT_BORDER;
                      });
                    }
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16,),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
                width: MediaQuery.of(context).size.width*0.9,
                child: Text(
                  "SEARCH",
                  style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
                  textAlign: TextAlign.center,
                ),
              ),
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getAgeDetails(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20),
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'From age',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  '18',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.appColour
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  'Years',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                  ),
                )
              ],
            ),
            SizedBox(width: 80,),
            Icon(Icons.forward, size: 30,),
            SizedBox(width: 80,),
            Column(
              children: [
                Text(
                  'To age',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  '70',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.appColour
                  ),
                ),
                SizedBox(width: 5,),
                Text(
                  'Years',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textField1({hintText, left, right, top, bottom}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        style: TextStyle(//color: Colors.grey
            //color: Colors.white
            ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            contentPadding: EdgeInsets.fromLTRB(left, top, right, bottom),
            isDense: true,
            enabledBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
            //border: InputBorder.none
            ),
      ),
    );
  }

  Widget myFirstWidget(Function onPressed) {
  return InkWell(
    onTap: onPressed,
      child: Container(//width: MediaQuery.of(context).size.width*0.5,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: borderColourFirst(), //             <--- BoxDecoration here
      child: Row(
        children: [
          Icon(Icons.check_circle_outline),
          SizedBox(width: 5,),
          Container(width: MediaQuery.of(context).size.width*0.3,
            child: Text(
              'Most active profiles on top',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget mySecondWidget(Function onPressed) {
  return InkWell(
    onTap: onPressed,
      child: Container(//width: MediaQuery.of(context).size.width*0.5,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: borderColourSecond(), //             <--- BoxDecoration here
      child: Row(
        children: [
          Icon(Icons.check_circle_outline),
          SizedBox(width: 5,),
          Container(width: MediaQuery.of(context).size.width*0.3,
            child: Text(
              'Most active profiles on top',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget myThirdWidget(Function onPressed) {
  return InkWell(
    onTap: onPressed,
      child: Container(//width: MediaQuery.of(context).size.width*0.5,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: borderColourThird(), //             <--- BoxDecoration here
      child: Row(
        children: [
          Icon(Icons.check_circle_outline),
          SizedBox(width: 5,),
          Container(width: MediaQuery.of(context).size.width*0.3,
            child: Text(
              'Most active profiles on top',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget myFourthWidget(Function onPressed) {
  return InkWell(
    onTap: onPressed,
      child: Container(//width: MediaQuery.of(context).size.width*0.5,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: borderColourFourth(), //             <--- BoxDecoration here
      child: Row(
        children: [
          Icon(Icons.check_circle_outline),
          SizedBox(width: 5,),
          Container(width: MediaQuery.of(context).size.width*0.3,
            child: Text(
              'Most active profiles on top',
              style: TextStyle(
                fontSize: 20
              ),
            ),
          )
        ],
      ),
    ),
  );
}
BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(color: AppTheme.grey),
  );
}

}