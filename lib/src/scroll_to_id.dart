import 'package:flutter/material.dart';
import 'package:scroll_to_id/src/scroll_content_with_key.dart';

class ScrollToId {

  ScrollController scrollController = ScrollController();
  List<ScrollContentWithKey> scrollContentsList = [];

  /// This function is to scroll to the widget that holds id.
  /// id is a required parameter that defines a default position to scroll.
  void scroll({String id}) {

    /// Scroll Target Height
    double sumHeight = 0;

    for(ScrollContentWithKey scrollContents in scrollContentsList) {
      if(scrollContents.id == id) {
        try {
          if(sumHeight < scrollController.position.maxScrollExtent) {
            /// Scroll to id position
            scrollController.animateTo(sumHeight, duration: Duration(milliseconds: 500), curve: Curves.ease);
            break;

          } else {
            /// Case Scrollable range is exceeded, Scroll to MaxScrollExtent
            scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
            break;

          }

        } catch(e) {
          print('$e');
          break;
        }

      } else {
        try {
          /// update Scroll target height
          sumHeight += scrollContents.key.currentContext.size.height;

        } catch(e) {
          print('$e');
        }
      }
    }
  }

}