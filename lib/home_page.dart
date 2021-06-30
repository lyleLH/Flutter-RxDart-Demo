import 'package:flutter/material.dart';
import 'package:my_app/repo_models/items.dart';
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
  String userInputText = '';
  late TextEditingController _controller =
      TextEditingController(text: userInputText);

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
                repoContent(context),
                Divider(
                  height: 50,
                ),
                Container(
                  child: repoList(context),
                  height: 400,
                ),
                Divider(
                  height: 50,
                ),
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

  StreamBuilder<Repository> repoList(BuildContext context) {
    return StreamBuilder<Repository>(
      stream: netWork.repo.stream,
      builder: (BuildContext context, AsyncSnapshot<Repository> snapshot) {
        Widget content;
        if (snapshot.hasData) {
          Repository repo;
          repo = snapshot.requireData;
          content = ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            scrollDirection: Axis.vertical, //垂直列表
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              Items item = repo.items![index];
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.lightGreenAccent,
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Name : ${item.name}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text('FullName : ${item.fullName}'),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      alignment: Alignment.centerLeft,
                      child: Text('Description : ${item.description}'),
                    ),
                    Divider(
                      height: 1.0,
                    ),
                  ],
                ),
              );
            },
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
        return content;
      },
    );
  }
}
