import 'package:flutter/material.dart';
import 'package:my_app/models/weather_info.dart';
import 'network.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    netWork.requetWeatherData("London");
    netWork.requetWeatherData("New York");
    netWork.requetWeatherData("Shenzhen");
    netWork.requetWeatherData("Wuhan");

    return StreamBuilder<WeatherInfo>(
      stream: netWork.subject.stream,
      builder: (context, AsyncSnapshot<WeatherInfo> snapshot) {
        var text = "";
        if (snapshot.hasData) {
          WeatherInfo info = snapshot.requireData;
          print(info);
          text = "${info.name} ${info.sys!.country}";
        } else if (snapshot.hasError) {
          print("error");
          text = "error";
        } else {
          print("what?");
          text = "what";
        }
        return contentWithData(text);
      },
    );
  }

  Scaffold contentWithData(String text) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: Container(
        child: Text("$text"),
        alignment: Alignment.center,
      ),
    );
  }
}
