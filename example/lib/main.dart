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
              children: [
                ScrollContent(
                  id: '1',
                  child: Container(
                    height: 600,
                    color: Colors.green,
                  ),
                ),
                ScrollContent(
                  id: '2',
                  child: Container(
                    height: 800,
                    color: Colors.red,
                  ),
                ),
                ScrollContent(
                  id: '3',
                  child: Container(
                    height: 300,
                    color: Colors.yellow,
                  ),
                ),
                ScrollContent(
                  id: '4',
                  child: Container(
                    height: 700,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('1', style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                    ),
                    onTap: () {
                      scrollToId.scroll(id: '1');
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('2', style: TextStyle(color: Colors.white),),
                      color: Colors.red,
                    ),
                    onTap: () {
                      scrollToId.scroll(id: '2');
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('3', style: TextStyle(color: Colors.white),),
                      color: Colors.yellow,
                    ),
                    onTap: () {
                      scrollToId.scroll(id: '3');
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 50,
                      child: Text('4', style: TextStyle(color: Colors.white),),
                      color: Colors.blue,
                    ),
                    onTap: () {
                      scrollToId.scroll(id: '4');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
