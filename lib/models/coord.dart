import 'package:equatable/equatable.dart';

class Coord extends Equatable {
  final double? lon;
  final double? lat;

  const Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'] as double?,
        lat: json['lat'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };

  Coord copyWith({
    double? lon,
    double? lat,
  }) {
    return Coord(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [lon, lat];
}
