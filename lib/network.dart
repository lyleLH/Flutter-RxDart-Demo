import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import './weather_models/weather_info.dart';
import './repo_models/repository.dart';

class NetWork {
  final BehaviorSubject<WeatherInfo> _subject = BehaviorSubject<WeatherInfo>();

  final BehaviorSubject<Repository> _repoSubject =
      BehaviorSubject<Repository>();

  requetWeatherData(String city) async {
    var dio = Dio();
    var baseURL = "http://api.openweathermap.org/data/2.5/weather";
    var param = {"appid": "fd5489917aec099715785ebd7593340d", "q": city};
    try {
      final response = await dio.get(baseURL, queryParameters: param);
      WeatherInfo info = WeatherInfo.fromJson(response.data);
      _subject.sink.add(info);
    } catch (e) {
      print(e);
    }
  }

  requestRepoData(String keyword) async {
    var dio = Dio();
    var baseURL = "https://api.github.com/search/repositories";
    var param = {"q": keyword};
    try {
      final response = await dio.get(baseURL, queryParameters: param);
      print(response.data);
      Repository repo = Repository.fromJson(response.data);
      _repoSubject.sink.add(repo);
    } catch (e) {
      print(e);
    }
  }

  dispose() {
    _subject.close();
    _repoSubject.close();
  }

  BehaviorSubject<WeatherInfo> get subject => _subject;
  BehaviorSubject<Repository> get repo => _repoSubject;
}

final netWork = NetWork();
