import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushTo({required BuildContext context, required String path, Object? extra}) {
  context.push(path, extra: extra);
}

pushReplacement(BuildContext context, String path) {
  context.pushReplacement(path);
}
pushToBase(BuildContext context, String path, {Object? extra}) {
  context.go(path, extra: extra);
}


pop(BuildContext context) {
  context.pop(context);
}
