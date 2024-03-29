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
  ScrollToId? scrollToId;
  final ScrollController scrollController = ScrollController();

  List<Color> _colorList = [
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blue
  ];

  void _scrollListener() {
    print(scrollToId!.idPosition());
  }

  @override
  void initState() {
    super.initState();

    /// Create ScrollToId instance
    scrollToId = ScrollToId(scrollController: scrollController);

    scrollController.addListener(_scrollListener);
  }

  /// Generate 10 Container
  /// Case [Axis.horizontal] set buildStackHorizontal() to body
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scroll to id',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Scroll to id'),
        ),
        body: buildStackVertical(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            scrollToId!.animateToNext(
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          },
        ),
      ),
    );
  }

  /// [Axis.vertical]
  /// https://raw.githubusercontent.com/wiki/yusukeinouehatchout/scroll_to_id/gif/scroll_to_id_vertical.gif
  Widget buildStackVertical() {
    return Stack(
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
                child: Text(
                  '$index',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
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
                  child: Text(
                    '$index',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: _colorList[index % _colorList.length],
                ),
                onTap: () {
                  /// scroll with animation
                  scrollToId!.animateTo('$index',
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);

                  /// scroll with jump
                  // scrollToId.jumpTo('$index');
                },
              );
            }),
          ),
        )
      ],
    );
  }

  /// [Axis.horizontal]
  /// https://raw.githubusercontent.com/wiki/yusukeinouehatchout/scroll_to_id/gif/scroll_to_id_horizontal.gif
  Widget buildStackHorizontal() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(10, (index) {
              return Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: _colorList[index % _colorList.length],
                  ),
                  onTap: () {
                    /// scroll with animation
                    scrollToId!.animateTo('$index',
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);

                    /// scroll with jump
                    // scrollToId.jumpTo('$index');
                  },
                ),
              );
            }),
          ),
        ),
        Expanded(
          child: InteractiveScrollViewer(
            scrollToId: scrollToId,
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return ScrollContent(
                id: '$index',
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: Text(
                    '$index',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  color: _colorList[index % _colorList.length],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
