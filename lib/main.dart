import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("Homepage"),
              floating: true,
              pinned: true,
              snap: true,
              expandedHeight: 150,
              leading: Icon(Icons.menu),
              backgroundColor: Colors.teal,
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) => ListTile(title: Text('Note #${index + 1}')),
            //     childCount: 10,
            //   ),
            // )
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext contest, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * index % 9],
                    child: Text('Note ${index + 1}'),
                  );
                },
                childCount: 10,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'new note',
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
        ));
  }
}
