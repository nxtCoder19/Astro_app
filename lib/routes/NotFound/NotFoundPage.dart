import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page not found')),
      body: Center(
        child: Text('Something went wrong. Please try again.'),
      ),
    );
  }
}
