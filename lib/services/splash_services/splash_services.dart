import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(const Duration(seconds: 5), () => context.go('/home'));
  }
}
