import 'package:flutter/material.dart';
import 'commons/widgets/custom_tab_bar.dart';
import 'modules/home/pages/home.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "Navigation Basics",
//     home: HomePage(),
//   ));
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bpttom Navi Bar",
      home: CustomTabbar(),
    );
  }
}
