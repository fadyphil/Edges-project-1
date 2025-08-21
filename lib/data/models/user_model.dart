// lib/data/models/user_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_1/data/models/enums.dart'; 

part 'user_model.freezed.dart';

/// Represents the user's profile information.
@freezed
abstract class User with _$User {
  const factory User({
    required String name,
    required UserCookingLevel level,
  }) = _User;
}