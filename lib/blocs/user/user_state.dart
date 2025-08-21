import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/models.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    required User user,
  }) = _UserState;

}