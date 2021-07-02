import 'package:my_app/commons/network/YKNetWorking.dart';
import 'package:my_app/modules/home/model/weather_models/weather_info.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  final BehaviorSubject<WeatherInfo> _subject = BehaviorSubject<WeatherInfo>();
  BehaviorSubject<WeatherInfo> get subject => _subject;

  requetWeatherData(String city) async {
    var param = {"appid": "fd5489917aec099715785ebd7593340d", "q": city};
    try {
      final response =
          await YKNetWorking.request().get("/weather", queryParameters: param);
      WeatherInfo info = WeatherInfo.fromJson(response.data);
      _subject.sink.add(info);
    } catch (e) {
      print(e);
    }
  }

  dispose() {
    _subject.close();
  }
}
