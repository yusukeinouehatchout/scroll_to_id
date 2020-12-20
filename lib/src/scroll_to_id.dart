import 'package:flutter/material.dart';
import 'package:scroll_to_id/src/scroll_content_with_key.dart';

class ScrollToId {
  final ScrollController scrollController;
  List<ScrollContentWithKey> scrollContentsList = [];
  Axis scrollDirection;

  ScrollToId({this.scrollController});

  /// Get id by scroll position
  String idPosition() {
    double sumSize = 0;
    for (ScrollContentWithKey scrollContents in scrollContentsList) {
      /// Update Scroll target size
      if (scrollDirection == Axis.vertical) {
        /// Default
        sumSize += scrollContents.key.currentContext.size.height;
      } else {
        sumSize += scrollContents.key.currentContext.size.width;
      }

      if (scrollController.offset < sumSize) {
        return scrollContents.id;
      }
    }
    return null;
  }

  /// This function is to scroll with animation.
  /// The first argument is id(String), not height(double).
  Future<void> animateTo(String id,
      {@required Duration duration, @required Curve curve}) async {
    Function _function = (double offset) {
      scrollController.animateTo(offset, duration: duration, curve: curve);
    };
    _scroll(id: id, scrollFunction: _function);
  }

  /// This function is to jump.
  /// The first argument is id(String), not size(double).
  Future<void> jumpTo(String id) async {
    Function _function = (double offset) {
      scrollController.jumpTo(offset);
    };
    _scroll(id: id, scrollFunction: _function);
  }

  /// This function is to scroll to the widget that holds id.
  /// id is a required parameter that defines a default position to scroll.
  void _scroll({String id, Function scrollFunction}) {
    /// Scroll target size
    double sumSize = 0;

    for (ScrollContentWithKey scrollContents in scrollContentsList) {
      if (scrollContents.id == id) {
        try {
          if (sumSize < scrollController.position.maxScrollExtent) {
            /// Scroll to id position
            scrollFunction(sumSize);
            break;
          } else {
            /// Case scrollable range is exceeded, scroll to MaxScrollExtent
            scrollFunction(scrollController.position.maxScrollExtent);
            break;
          }
        } catch (e) {
          print('$e');
          break;
        }
      } else {
        try {
          /// Update Scroll target size
          if (scrollDirection == Axis.vertical) {
            /// Default
            sumSize += scrollContents.key.currentContext.size.height;
          } else {
            sumSize += scrollContents.key.currentContext.size.width;
          }
        } catch (e) {
          print('$e');
        }
      }
    }
  }
}
