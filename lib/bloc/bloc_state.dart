import 'package:flutter/material.dart';
import '../module/theme.dart';

import '/model/user_model.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class ThemeState extends BlocState{
  final Themeenum theme;
  ThemeState(this.theme);
}

class Failed extends BlocState {
  final Exception exception;
  Failed(this.exception);
}

class Authenticated extends BlocState {
  final UserModel user;
  Authenticated(this.user);
}
