import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/modules/bloc/views/two_status_button.dart';

class BLOCDemoPages extends StatefulWidget {
  BLOCDemoPages({Key? key}) : super(key: key);

  @override
  _BLOCDemoPagesState createState() => _BLOCDemoPagesState();
}

class _BLOCDemoPagesState extends State<BLOCDemoPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOC"),
      ),
      body: Center(
        child: Container(
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TwoStatusButton(
                index: 0,
                onChange: (bool tag) {
                  print(tag.toString());
                },
              ),
              Container(
                color: Colors.white,
                width: 50,
              ),
              TwoStatusButton(
                index: 0,
                onChange: (bool tag) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
