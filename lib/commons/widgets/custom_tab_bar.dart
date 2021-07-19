import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/modules/bloc/bloc_demo.dart';
import 'package:my_app/modules/home/pages/home.dart';

class CustomTabbar extends StatefulWidget {
  CustomTabbar({Key? key}) : super(key: key);

  @override
  _CustomTabbarState createState() => _CustomTabbarState();
}

class _CustomTabbarState extends State<CustomTabbar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BLOCDemoPages(),
    Text("Profile"),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Tabbar"),
        // ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "BLoc"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTap,
        ),
      ),
    );
  }
}
