import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import './models/weather_info.dart';

class NetWork {
  final BehaviorSubject<WeatherInfo> _subject = BehaviorSubject<WeatherInfo>();

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

  dispose() {
    _subject.close();
  }

  BehaviorSubject<WeatherInfo> get subject => _subject;
}

final netWork = NetWork();
