import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushTo({required BuildContext context, required String path, Object? extra}) {
  context.push(path, extra: extra);
}

pushReplacement(BuildContext context, String path) {
  context.pushReplacement(path);
}

pushtToBase(BuildContext context, String path) {
  context.go(path);
}

pop(BuildContext context) {
  context.pop(context);
}
