import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepoListPage extends StatefulWidget {
  RepoListPage({Key? key}) : super(key: key);

  @override
  _RepoListPageState createState() => _RepoListPageState();
}

class _RepoListPageState extends State<RepoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("仓库列表"),
      ),
      body: Container(
        child: null,
      ),
    );
  }
}
