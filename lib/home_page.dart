import 'package:flutter/material.dart';
import 'package:my_app/repo_models/repository.dart';
import 'package:my_app/weather_models/weather_info.dart';
import 'network.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    netWork.requetWeatherData("New York");
    SVProgressHUD.show(status: 'Doing Stuff');
    return Scaffold(
      appBar: AppBar(
        title: Text("天气"),
      ),
      body: StreamBuilder<WeatherInfo>(
        stream: netWork.subject.stream,
        builder: (context, AsyncSnapshot<WeatherInfo> snapshot) {
          SVProgressHUD.dismiss();
          Container content;
          if (snapshot.hasData) {
            WeatherInfo info;
            info = snapshot.requireData;
            content = contentWithData("${info.name}", "${info.sys!.country}");
          } else if (snapshot.hasError) {
            content = contentWithData("Null", "Null}");
          } else {
            content = contentWithData("Null", "Null}");
          }
          // return contentWithData(text);
          return Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          netWork.requetWeatherData("London");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("London"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          netWork.requetWeatherData("New York");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("New York"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          netWork.requetWeatherData("Wuhan");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("Wuhan"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          netWork.requetWeatherData("Shenzhen");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("Shenzhen"),
                      ),
                    )
                  ],
                ),
                Divider(
                  height: 50,
                ),
                content,
                Divider(
                  height: 50,
                ),
                repoContent(context)
              ],
            ),
          );
        },
      ),
    );
  }

  Container contentWithData(String city, String country) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$city"),
          Text("$country"),
        ],
      ),
      alignment: Alignment.center,
    );
  }

  StreamBuilder<Repository> repoContent(BuildContext context) {
    return StreamBuilder<Repository>(
      stream: netWork.repo.stream,
      builder: (BuildContext context, AsyncSnapshot<Repository> snapshot) {
        SVProgressHUD.dismiss();
        Container content;
        if (snapshot.hasData) {
          Repository repo;
          repo = snapshot.requireData;
          content = Container(
            child: Text("YES"),
          );
        } else if (snapshot.hasError) {
          content = Container(
            child: Text("No"),
          );
        } else {
          content = Container(
            child: Text("Null"),
          );
        }
        return Column(
          children: [
            Container(
              height: 85,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        netWork.requestRepoData("rxdart");
                        SVProgressHUD.show(status: 'Doing Stuff');
                      },
                      child: Text("搜索"),
                    ),
                  )
                ],
              ),
            ),
            content
          ],
        );
      },
    );
  }
}
