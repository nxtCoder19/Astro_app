import 'package:astro_app/utils/Theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:multi_image_picker/multi_image_picker.dart';

void main() => runApp(new AccessGallery());

class AccessGallery extends StatefulWidget {
  @override
  _AccessGalleryState createState() => new _AccessGalleryState();
}

class _AccessGalleryState extends State<AccessGallery> {
  List<Asset> images = List<Asset>();
  String _error;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
    });

    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Access from galery",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
        body: Column(
          children: <Widget>[
            //Center(child: Text('Error: $_error')),
            RaisedButton(
              child: Text("Pick images"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: images == null ? 
                     Text('No images selected') :
                     buildGridView()
            )
          ],
        ),
      ),
    );
  }
}
