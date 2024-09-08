import 'package:flutter/material.dart';

class ContainerDecoration {
  static var decoration = BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(30),
      boxShadow: const [BoxShadow(offset: Offset(8, 8), blurRadius: 8)]);
}
