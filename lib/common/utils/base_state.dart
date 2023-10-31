import 'package:bloc_example/common/utils/status.dart';

abstract class BaseState {
  final Status status = Status.initial;
  final String message = '';
}
