import 'package:dio/dio.dart';

class YKNetWorking {
  static final YKNetWorking _instance = YKNetWorking._internal();

  factory YKNetWorking() {
    return _instance;
  }

  YKNetWorking._internal() {
    init();
  }

  void init() {
    // print("这里初始化");
  }

  static Dio request() {
    var _dio;
    _dio = Dio();
    _dio.options.baseUrl = "http://api.openweathermap.org/data/2.5";
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, handler) {
          print("onRequest --$options");
          return handler.next(options);
        },
        onResponse: (Response response, handler) {
          print("onResponse --\n\n$response\n\n--\n");
          return handler.next(response);
        },
        onError: (DioError options, handler) {
          return handler.next(options);
        },
      ),
    );

    return _dio;
  }
}
