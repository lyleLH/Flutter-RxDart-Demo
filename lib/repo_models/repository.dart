import 'package:equatable/equatable.dart';

import 'items.dart';

class Repository extends Equatable {
  final int? totalCount;
  final bool? incompleteResults;
  final List<Items>? items;

  const Repository({this.totalCount, this.incompleteResults, this.items});

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        totalCount: json['total_count'] as int?,
        incompleteResults: json['incomplete_results'] as bool?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'total_count': totalCount,
        'incomplete_results': incompleteResults,
        'items': items?.map((e) => e.toJson()).toList(),
      };

  Repository copyWith({
    int? totalCount,
    bool? incompleteResults,
    List<Items>? items,
  }) {
    return Repository(
      totalCount: totalCount ?? this.totalCount,
      incompleteResults: incompleteResults ?? this.incompleteResults,
      items: items ?? this.items,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [totalCount, incompleteResults, items];
}
