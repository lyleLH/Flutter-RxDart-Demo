import 'package:equatable/equatable.dart';

class Wind extends Equatable {
  final double? speed;
  final int? deg;

  const Wind({this.speed, this.deg});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'] as double?,
        deg: json['deg'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'speed': speed,
        'deg': deg,
      };

  Wind copyWith({
    double? speed,
    int? deg,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [speed, deg];
}
