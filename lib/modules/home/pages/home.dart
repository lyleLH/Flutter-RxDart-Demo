import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:my_app/commons/network/YKNetWorking.dart';
import 'package:my_app/commons/network/network.dart';
import 'package:my_app/modules/home/model/repo_models/items.dart';
import 'package:my_app/modules/home/model/repo_models/repository.dart';
import 'package:my_app/modules/home/model/weather_models/weather_info.dart';
import 'package:my_app/modules/home/viewmodel/home_view_model.dart';
import 'package:my_app/modules/repo/pages/customer_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  var _homeViewModel = HomeViewModel();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String userInputText = '';
  late TextEditingController _controller =
      TextEditingController(text: userInputText);

  @override
  Widget build(BuildContext context) {
    widget._homeViewModel.requetWeatherData("New York");
    // netWork.requetWeatherData("New York");
    SVProgressHUD.show(status: 'Doing Stuff');
    return Scaffold(
      appBar: AppBar(
        title: Text("天气"),
      ),
      body: StreamBuilder<WeatherInfo>(
        stream: widget._homeViewModel.subject.stream,
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
                          widget._homeViewModel.requetWeatherData("London");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("London"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          widget._homeViewModel.requetWeatherData("New York");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("New York"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          widget._homeViewModel.requetWeatherData("Wuhan");
                          SVProgressHUD.show(status: 'Doing Stuff');
                        },
                        child: Text("Wuhan"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          widget._homeViewModel.requetWeatherData("Shenzhen");
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
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  height: 50,
                  child: CupertinoTextField(
                    controller: _controller,
                  ),
                ),
                repoContent(context),
                Divider(
                  height: 50,
                ),
                Container(
                  child: repoList(context),
                  height: 300,
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
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
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
                return _buildListItem(repo, context, index);
              });
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

  Widget _buildListItem(Repository repo, BuildContext ctx, int index) {
    Items item = repo.items![index];
    return GestureDetector(
      child: Container(
        color: index % 2 == 0 ? Colors.white : Colors.lightGreenAccent,
        padding: EdgeInsets.only(left: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Name : ${item.name}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
      ),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CustomerListPage(),
          ),
        )
      },
    );
  }
}
