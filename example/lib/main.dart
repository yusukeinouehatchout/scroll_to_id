import 'package:flutter/material.dart';

import 'package:scroll_to_id/scroll_to_id.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final ScrollToId scrollToId = ScrollToId();

  List<Color> _colorList = [Colors.green, Colors.red, Colors.yellow, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll to ID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scroll to ID'),
        ),
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            InteractiveScrollViewer(
              scrollToId: scrollToId,
              children: List.generate(10, (index) {
                return ScrollContent(
                  id: '$index',
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 200,
                    child: Text('$index', style: TextStyle(color: Colors.white, fontSize: 50),),
                    color: _colorList[index % _colorList.length],
                  ),
                );
              }),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(10, (index) {
                  return GestureDetector(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('$index', style: TextStyle(color: Colors.white),),
                      color: _colorList[index % _colorList.length],
                    ),
                    onTap: () {
                      scrollToId.scroll(id: '$index');
                    },
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

}