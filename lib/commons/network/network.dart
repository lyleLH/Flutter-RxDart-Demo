import 'package:dio/dio.dart';
import 'package:my_app/modules/home/model/repo_models/repository.dart';
import 'package:rxdart/rxdart.dart';

import 'YKNetWorking.dart';

class NetWork {
  final BehaviorSubject<Repository> _repoSubject =
      BehaviorSubject<Repository>();
  requestRepoData(String keyword) async {
    var dio = Dio();
    var baseURL = "https://api.github.com/search/repositories";
    var param = {"q": keyword};
    try {
      final response = await dio.get(baseURL, queryParameters: param);
      // print(response.data);
      Repository repo = Repository.fromJson(response.data);
      _repoSubject.sink.add(repo);
    } catch (e) {
      print(e);
    }
  }

  dispose() {
    _repoSubject.close();
  }

  BehaviorSubject<Repository> get repo => _repoSubject;
}

final netWork = NetWork();
