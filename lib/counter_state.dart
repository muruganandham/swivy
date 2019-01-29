import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class CounterState extends Equatable {
  final int counter;
  CounterState(this.counter) : super([counter]);
}
