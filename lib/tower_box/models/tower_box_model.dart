// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TowerBoxModel extends Equatable {
  final int index;
  final String styleBox;
  final String procressType;

  const TowerBoxModel(
      {required this.index,
      required this.styleBox,
      required this.procressType});

  @override
  List<Object?> get props => [index, styleBox];

  TowerBoxModel copyWith({
    int? index,
    String? styleBox,
    String? procressType,
  }) {
    return TowerBoxModel(
        index: index ?? this.index,
        styleBox: styleBox ?? this.styleBox,
        procressType: procressType ?? this.procressType);
  }
}
