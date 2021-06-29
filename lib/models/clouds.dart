import 'package:equatable/equatable.dart';

class Clouds extends Equatable {
  final int? all;

  const Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'all': all,
      };

  Clouds copyWith({
    int? all,
  }) {
    return Clouds(
      all: all ?? this.all,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [all];
}
