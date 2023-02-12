import 'package:equatable/equatable.dart';

class BoxModel extends Equatable {
  final int index;
  final String styleBox;

  const BoxModel({required this.index, required this.styleBox});

  @override
  List<Object?> get props => [index, styleBox];
}
