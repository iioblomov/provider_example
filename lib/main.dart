import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        // ChangeNotifierProvider wraps the screen where Provider is used
        home: ChangeNotifierProvider(
          create: (_) => ClickCounter(), // define the data
          child: MyHomePage(),
        ),
      );
}

// Structure of the data passed around ChangeNotifierProvider area
class ClickCounter with ChangeNotifier {
  int count = 0;
  // change counter
  void add() {
    count++;
    notifyListeners(); // tell Consumer to change
  }
}

// We use: stateLESS + Provider instead of stateFULL + setState
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Times pressed:'),
            // listen and display data
            Text('${context.watch<ClickCounter>().count}'),
            RaisedButton(
              // update data
              onPressed: () => context.read<ClickCounter>().add(),
              child: Icon(Icons.add),
            ),
          ],
        ),
      ), // This tr
    );
  }
}
