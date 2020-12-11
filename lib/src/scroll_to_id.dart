import 'package:flutter/material.dart';
import 'package:scroll_to_id/src/scroll_content_with_key.dart';

class ScrollToId {

  ScrollController scrollController = ScrollController();
  List<ScrollContentWithKey> scrollContentsList = [];

  void scroll({String id}) {

    /// Scroll Target Height
    double sumHeight = 0;

    for(ScrollContentWithKey scrollContents in scrollContentsList) {
      if(scrollContents.id == id) {
        try {
          if(sumHeight < scrollController.position.maxScrollExtent) {
            /// Scroll to ID position
            scrollController.animateTo(sumHeight, duration: Duration(milliseconds: 500), curve: Curves.ease);
            break;

          } else {
            /// When Scrollable range is exceeded, Scroll to MaxScrollExtent
            scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
            break;

          }

        } catch(e) {
          print('$e');
          break;
        }

      } else {
        try {
          /// update Scroll target
          sumHeight += scrollContents.key.currentContext.size.height;

        } catch(e) {
          print('$e');
        }
      }
    }
  }

}