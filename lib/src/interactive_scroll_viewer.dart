import 'package:flutter/material.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:scroll_to_id/src/scroll_content_with_key.dart';

/// InteractiveScrollViewer is required widget for using scroll_to_id.
/// This widget is customized version of 'SingleChildScrollView'.
/// children and scrollToId is required parameter.
class InteractiveScrollViewer extends StatefulWidget {
  final ScrollToId scrollToId;
  final List<ScrollContent> children;

  InteractiveScrollViewer({@required this.children, @required this.scrollToId});

  @override
  _InteractiveScrollViewerState createState() =>
      _InteractiveScrollViewerState();
}

class _InteractiveScrollViewerState extends State<InteractiveScrollViewer> {
  @override
  void initState() {
    super.initState();

    /// Convert ScrollContent to ScrollContentWithKey
    for (ScrollContent scrollContents in widget.children) {
      widget.scrollToId.scrollContentsList
          .add(ScrollContentWithKey.fromWithout(scrollContents));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollToId.scrollController,
      child: Column(
        children: widget.scrollToId.scrollContentsList.map((scrollContents) {
          /// This widget is to get the size of its widget.
          return RepaintBoundary(
            key: scrollContents.key,
            child: scrollContents.child,
          );
        }).toList(),
      ),
    );
  }
}
