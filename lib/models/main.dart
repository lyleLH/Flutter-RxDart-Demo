import 'package:equatable/equatable.dart';

class Main extends Equatable {
  final double? temp;
  final int? pressure;
  final int? humidity;
  final double? tempMin;
  final double? tempMax;

  const Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'] as double?,
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
        tempMin: json['temp_min'] as double?,
        tempMax: json['temp_max'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'temp': temp,
        'pressure': pressure,
        'humidity': humidity,
        'temp_min': tempMin,
        'temp_max': tempMax,
      };

  Main copyWith({
    double? temp,
    int? pressure,
    int? humidity,
    double? tempMin,
    double? tempMax,
  }) {
    return Main(
      temp: temp ?? this.temp,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [temp, pressure, humidity, tempMin, tempMax];
}
