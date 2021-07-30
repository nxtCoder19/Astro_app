import 'package:astro_app/screens/addmedia/access_gallery.dart';
import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';
import './access_camera.dart';

class SelectSource extends StatefulWidget {
  @override
  _SelectSourceState createState() => _SelectSourceState();
}

class _SelectSourceState extends State<SelectSource> {
  //in your code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.appColour
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Select Source",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                print("camera button");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccessCamera()));
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[100],
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  'Camera',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccessGallery()));
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[100],
                  child: Icon(
                    Icons.photo,
                    color: Colors.grey,
                  ),
                ),
                title: Text(
                  'Gallery',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
