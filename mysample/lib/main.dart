import 'package:flutter/material.dart';

void main() => runApp(const ReorderableApp());

class ReorderableApp extends StatelessWidget {
  const ReorderableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ReorderableListView Sample')),
        body: const ReorderableExample(),
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});

  @override
  State<ReorderableExample> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ReorderableExample> {
  final List<int> items = List<int>.generate(4, (int index) => index);
  var greyMenu = Color.fromRGBO(232, 232, 232, 1);
  var blueMenu = Color.fromRGBO(225, 237, 255, 1);
  var orangeMenu = Color.fromRGBO(255, 240, 217, 1);
  var azureMenu = Color.fromRGBO(212, 250, 253, 1);
  late var menuColors2 = [greyMenu, blueMenu, orangeMenu, azureMenu];
  final menuColors = [Color.fromRGBO(232, 232, 232, 1), Color.fromRGBO(225, 237, 255, 1), Color.fromRGBO(255, 240, 217, 1), Color.fromRGBO(212, 250, 253, 1)];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            int item = items.removeAt(oldIndex);
            items.insert(newIndex, item);

            Color menuColor = menuColors.removeAt(oldIndex);
            menuColors.insert(newIndex, menuColor);

            // print(items);
            // print(menuColors);
          });
        },
        children: <Widget>[
          for (int index = 0; index < items.length; index += 1)
            SizedBox(
              key: Key('$index'),
              height: 1000 * 0.175,
              width: 1920,
              child: Container(child: Text('Item ${items[index]}'), color: menuColors[index]),
            ),
          // SizedBox(
          //     key: Key('$index'),
          //     height: 1000 * 0.175,
          //     width: 1920,
          //     child: Container(
          //       color: menuColors[index],
          //     ))
        ]);
  }
}
