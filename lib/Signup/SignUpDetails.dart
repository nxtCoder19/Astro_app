
import 'package:astro_app/Dashboard/CardSection/CardSectionAlignment.dart';
import 'package:astro_app/Dashboard/Profile/components/MoodSelectionScreen.dart';
import 'package:astro_app/Dashboard/index.dart';
import 'package:astro_app/Login/login_screen.dart';
import 'package:astro_app/common/hexacolor.dart';
import 'package:astro_app/model/tags_data.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:astro_app/utils/rest/api/userApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:toast/toast.dart';

const double _kPickerSheetHeight = 216.0;
enum TAG_STATE {SELECTED_TAG, NOT_SELECTEDTAG}

class SignUpDetailsScreen extends StatefulWidget {

  String gender;
  String birthdate;
  String relationshipstatus;
  String city;
  String country;

  SignUpDetailsScreen(this.gender, this.birthdate, this.relationshipstatus, this.city,this.country);

  @override
  _SignUpDetailsScreenState createState() => _SignUpDetailsScreenState();
}

class _SignUpDetailsScreenState extends State<SignUpDetailsScreen> {

  TAG_STATE tagState = TAG_STATE.NOT_SELECTEDTAG;
  bool _onPressed = true;
  double years = 18.0;
  List<bool> _selected = List.generate(10, (i) => true); 

  BoxDecoration tagColour() {
    switch (tagState) {
      case TAG_STATE.SELECTED_TAG:
        return myBoxDecoration1();
      case TAG_STATE.NOT_SELECTEDTAG:
        return myBoxDecoration();
    }
  }

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var companyNameController = TextEditingController();
  var locationController = TextEditingController();
  var websiteController = TextEditingController();
  var positionController = TextEditingController();
  var specializationController = TextEditingController();
  double _width;
  double _height;

  Future<List<TagsData>> allTagsData;

  //String city = 'kolkata';
  String tags = '#teamsports';
  String birthTime = '2:00 AM';
  //String relationshipstatus = 'single';
  String seeking = 'F';

  @override
  void initState() {
    allTagsData = TagsData.getTagsDataData();
    super.initState();
  }

  Future<String> addOtherInfo() async {
    bool responseBody = await userApi.addOtherInfo(
      userNameController.text, widget.gender, seeking, widget.birthdate.substring(0,10),
       birthTime, widget.city, widget.country, tags, widget.relationshipstatus);
    if (responseBody) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MoodSelectionScreen(years.toString().substring(0,2))));
    } else {
      showToast("Something went wrong, please try again!", duration: 3);
    }
  }

  // AuthService authService = new AuthService();
  //   DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // print('bith');
    // print(widget.birthdate);
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.white,
    bottomNavigationBar: 
      Padding(
        padding: const EdgeInsets.only(left: 24, right: 24,bottom: 8),
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
            width: MediaQuery.of(context).size.width*0.9,
            child: Text(
              "Next",
              style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            addOtherInfo();
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
          },
        ),
      ),
    appBar: AppBar(
          leading: Container(),backgroundColor: AppTheme.white,
          centerTitle: true,
          title: Text('Tell Us About Yourself',
          style: TextStyle(
            color: AppTheme.appColour
          ),),
        ),
      //appBar: appBarMain(context),
      body:
      SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 5,),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(height: _height*0.025),
                    TextFormField(
                        controller: userNameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            icon: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Icon(LineIcons.user),
                            )),
                        onEditingComplete: () {},
                        onSaved: (value) {}),
                        SizedBox(height: _height*0.05),
                    _lookingforPicker(context),
                        SizedBox(height: _height*0.07),
                        Container(
                          child: TextFormField(
                            //controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(fillColor: AppTheme.white,
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(color: AppTheme.black)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppTheme.appColour)),
                                labelText: 'About Me',labelStyle: TextStyle(color: AppTheme.black),
                              ),
                            onEditingComplete: () {},
                            onSaved: (value) {}),
                        ),
                    
                    SizedBox(height: _height*0.05),
                    yearRange(),
                    SizedBox(height: _height*0.025),
                    Text(
                      'Choose All that applies to you',
                      style: 
                      TextStyle(
                        fontSize: 20,
                        color: AppTheme.appColour,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                      ),
                    ),
                    SizedBox(height: _height*0.025),
                    Container(
                      child: Column(
                        children: [

                          FutureBuilder(
                            future: allTagsData,
                            builder: (BuildContext context,
                                AsyncSnapshot snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  break;
                                case ConnectionState.waiting:
                                  return Container(
                                    height: MediaQuery.of(context).size.height*0.1,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                  break;
                                case ConnectionState.active:
                                  break;
                                case ConnectionState.done:
                                  if (!snapshot.hasData) {
                                    return const Center(
                                        child: Text(
                                            'Something went wrong. Please try again.'));
                                  } else {
                                    if (snapshot.data.length > 0) {
                                      return GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
                                        childAspectRatio: MediaQuery.of(context).size.width /
                                                (MediaQuery.of(context).size.height / 6),),
                                        itemCount: snapshot.data.length,
                                        //padding: const EdgeInsets.only(top: 8),
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              print(snapshot.data[index].tags.toString());
                                              print(index);
                                              setState(() {
                                                _selected[index] = !_selected[index];
                                              });
                                            },
                                              child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: myBoxDecoration(),
                                                child: Center(
                                                  child: FittedBox(
                                                                                                      child: Text(
                                                      snapshot.data[index].tags.toString(),
                                                      style: TextStyle(
                                                        fontSize: 21,
                                                        color: _selected[index] ? Colors.grey : AppTheme.appColour
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              //child: _firsttagsWidget(snapshot.data[index]),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Center(
                                        child: Text("You have no tags yet"),
                                      );
                                    }
                                  }
                                  break;
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    // Column(
                    //   children: [
                    //     _tagsWidget('Non Vegeterian'),
                    //     _tagsWidget('Trying to Quit'),
                    //     _tagsWidget('Fitness freak'),
                    //     _tagsWidget('Aerobics'),
                    //     _tagsWidget('Non Smoker'),
                    //   ],
                    // )
                    // SizedBox(height: _height*0.025),
                    // myWidget('#teamsports'),
                    // SizedBox(height: _height*0.010),
                    // myWidget('#Athelete'),
                    // SizedBox(height: _height*0.010),
                    // myWidget('#painting'),
                    // SizedBox(height: _height*0.010),
                    // myWidget('#making music'),
                    // SizedBox(height: _height*0.010),
                    // myWidget('#dancing'),
                    // SizedBox(height: _height*0.05),
                    // _smokingPicker(context),
                    // SizedBox(height: _height*0.05),
                    // _drinkingPicker(context),
                    // SizedBox(height: _height*0.05),
                    // _workoutPicker(context),
                    // SizedBox(height: _height*0.05),
                    // _dietPicker(context)
                  ],
                ),
              ),
            //   SizedBox(height: _height*0.025,),
            //   InkWell(
            //               child: Container(
            //       padding: EdgeInsets.symmetric(vertical: 16,),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10), color: AppTheme.appColour),
            //       width: MediaQuery.of(context).size.width*0.9,
            //       child: Text(
            //         "Next",
            //         style: TextStyle(fontSize: 17, color: Colors.white),//color: CustomTheme.textColor),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //     onTap: () {
            //       addOtherInfo();
            //       //Navigator.push(context, MaterialPageRoute(builder: (context)=>CardsSectionAlignment(context)));
            //     },
            // ),
                  SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  Widget yearRange() {
    return Container(
      decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: MediaQuery.of(context).size.width*0.9,
      //padding: EdgeInsets.fromLTRB(10, 10, 10, 4),
      //decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Maximum Year",
                style: TextStyle(
                    color: AppTheme.appColour,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${years.round()} years.",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          Slider(
            value: years,
            onChanged: (newyears) {
              setState(() {
                years = newyears;
              });
            },
            min: 18,
            max: 75,
            activeColor: AppTheme.appColour,
          )
        ],
      ),
    );
  }

  Widget _tagsWidget (String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24
          ),
        ),
      ),
    );
  }

  Widget _firsttagsWidget (TagsData tags) {
    return Container(
      decoration: myBoxDecoration(),
      child: Center(
        child: Text(
          tags.tags,
          style: TextStyle(
            fontSize: 24,
            color: _onPressed ? Colors.black : AppTheme.appColour
          ),
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration1() {
  return BoxDecoration(
    border: Border.all(
      width: 3.0,color: AppTheme.appColour
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(30.0) //                 <--- border radius here
    ),
  );
}

  Widget myWidget(String text) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    padding: const EdgeInsets.all(10.0),
    decoration: myBoxDecoration(), //             <--- BoxDecoration here
    child: Text(
      text,
      style: TextStyle(fontSize: 18.0),
    ),
  );
}
BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      //width: 1.0
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(30.0) //                 <--- border radius here
    ),
  );
}

  var genderList = ['male', 'female', 'other'];
  var selectedGender = 'male';
  var genderListIndex = 0;

  _genderPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: genderListIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => genderListIndex = index);
                      },
                      children:
                          List<Widget>.generate(genderList.length, (int index) {
                        return Center(
                          child: Text(genderList[index][0].toUpperCase() +
                              genderList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedGender = genderList[genderListIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.male,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Gender')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(genderList[genderListIndex][0]
                                        .toUpperCase() +
                                    genderList[genderListIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  var relationshipList = ['engaged', 'married', 'separated', 'divorced'];
  var selectedRelationship = 'Engaged';
  var relationshipIndex = 0;

  _getRelationShipStatusPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: relationshipIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => relationshipIndex = index);
                      },
                      children:
                          List<Widget>.generate(genderList.length, (int index) {
                        return Center(
                          child: Text(genderList[index][0].toUpperCase() +
                              relationshipList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedRelationship = relationshipList[relationshipIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.male,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('RelationShip Status')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(relationshipList[relationshipIndex][0]
                                        .toUpperCase() +
                                    relationshipList[relationshipIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  var lookingForList = ['man', 'women', 'other'];
  var selectedLookingFor = 'man';
  var lookingForIndex = 0;

  _lookingforPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: lookingForIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => lookingForIndex = index);
                      },
                      children:
                          List<Widget>.generate(genderList.length, (int index) {
                        return Center(
                          child: Text(lookingForList[index][0].toUpperCase() +
                              lookingForList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedLookingFor = lookingForList[lookingForIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.male,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Looking For')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(lookingForList[lookingForIndex][0]
                                        .toUpperCase() +
                                    lookingForList[lookingForIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  
var lifestylechoicesList = ['smoker', 'not smoker', 'occasionaly', 'sometime', 'everytime'];
  var selectedlifestylechoices = 'smoker';
  var lifestylechoicesListIndex = 0;

  _smokingPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: lifestylechoicesListIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => lifestylechoicesListIndex = index);
                      },
                      children:
                          List<Widget>.generate(lifestylechoicesList.length, (int index) {
                        return Center(
                          child: Text(lifestylechoicesList[index][0].toUpperCase() +
                              lifestylechoicesList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedlifestylechoices = lifestylechoicesList[lifestylechoicesListIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(Icons.smoking_rooms,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Smoking')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(lifestylechoicesList[lifestylechoicesListIndex][0]
                                        .toUpperCase() +
                                    lifestylechoicesList[lifestylechoicesListIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  var dietanddrinkingList = ['Social Drinker', 'Habbit Drinker', 'No Drinking'];
  var selectedDietandDrinking = 'Social Drinker';
  var dietanddrinkingListIndex = 0;

  _drinkingPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: dietanddrinkingListIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => dietanddrinkingListIndex = index);
                      },
                      children:
                          List<Widget>.generate(dietanddrinkingList.length, (int index) {
                        return Center(
                          child: Text(dietanddrinkingList[index][0].toUpperCase() +
                              dietanddrinkingList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedDietandDrinking = dietanddrinkingList[dietanddrinkingListIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(Icons.local_drink,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Drinking')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(dietanddrinkingList[dietanddrinkingListIndex][0]
                                        .toUpperCase() +
                                    dietanddrinkingList[dietanddrinkingListIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  var workoutList = ['Sometimes', 'daily', 'weekly', 'monthly', 'not interest'];
  var selectedWorkout = 'Sometimes';
  var workoutListIndex = 0;

  _workoutPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: workoutListIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => workoutListIndex = index);
                      },
                      children:
                          List<Widget>.generate(workoutList.length, (int index) {
                        return Center(
                          child: Text(workoutList[index][0].toUpperCase() +
                              workoutList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedWorkout = workoutList[workoutListIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(Icons.work_outline,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Workout')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(workoutList[workoutListIndex][0]
                                        .toUpperCase() +
                                    workoutList[workoutListIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }

  var interestList = ['Vegeterian', 'Non-Vegeterian', 'Eggiterian'];
  var selectedInterest = 'Vegeterian';
  var interestListIndex = 0;

  _dietPicker(BuildContext context) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: interestListIndex);
    return Container(
        child: InkWell(
            onTap: () async {
              await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(CupertinoPicker(
                      scrollController: scrollController,
                      itemExtent: 44,
                      backgroundColor: CupertinoColors.white,
                      onSelectedItemChanged: (int index) {
                        setState(() => interestListIndex = index);
                      },
                      children:
                          List<Widget>.generate(interestList.length, (int index) {
                        return Center(
                          child: Text(interestList[index][0].toUpperCase() +
                              interestList[index].substring(1).toLowerCase()),
                        );
                      }),
                    ));
                  }).then((t) {
                selectedInterest = interestList[interestListIndex];
              });
            },
            child: Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Icon(LineIcons.delicious,
                      color: HexColor('#8C8C8C'), size: 24)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Diet')),
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(interestList[interestListIndex][0]
                                        .toUpperCase() +
                                    interestList[interestListIndex]
                                        .substring(1)
                                        .toLowerCase())),
                            Padding(
                                padding: EdgeInsets.only(top: 12),
                                child: Container(
                                    height: 1.2, color: HexColor('#8C8C8C')))
                          ])))
            ])));
  }
  

  _buildBottomPicker(Widget picker) {
    return Container(
        height: _kPickerSheetHeight,
        padding: const EdgeInsets.only(top: 6.0),
        color: CupertinoColors.white,
        child: DefaultTextStyle(
            style:
                const TextStyle(color: CupertinoColors.black, fontSize: 22.0),
            child: GestureDetector(
                // Blocks taps from propagating to the modal sheet and popping.
                onTap: () {},
                child: SafeArea(top: false, child: picker))));
  }
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}