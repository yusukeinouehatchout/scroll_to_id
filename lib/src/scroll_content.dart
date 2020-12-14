import 'package:flutter/material.dart';

/// ScrollContent is widget for you to get the height of its widget.
/// child is required.
class ScrollContent {
  final Widget child;
  final String id;

  ScrollContent({@required this.child, this.id});
}
