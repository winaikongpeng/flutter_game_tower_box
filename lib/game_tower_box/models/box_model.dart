// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BoxModel extends Equatable {
  final int index;
  final String styleBox;

  const BoxModel({required this.index, required this.styleBox});

  @override
  List<Object?> get props => [index, styleBox];


  BoxModel copyWith({
    int? index,
    String? styleBox,
  }) {
    return BoxModel(
      index: index ?? this.index,
      styleBox: styleBox ?? this.styleBox,
    );
  }
}
