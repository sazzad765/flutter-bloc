import 'package:bloc_example/utils/status.dart';

abstract class BaseState {
  final Status status = Status.initial;
  final String message = '';
}
