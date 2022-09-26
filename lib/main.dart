import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Annexe Café',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Annexe Café'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _liked = 156;

  void _doALike() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _liked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annexe Café Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Réservez moi un café',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Vous avez réservé un café pour moi')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fill,
              child: Image.asset('assets/images/café.jpg'),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Annexe Café',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '18 Rue Saint-Michel, 35000 Rennes',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w300),
                              ),
                            ])),
                    Expanded(
                        flex: 1,
                        child: InkWell(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              Text("${_liked}")
                            ]),
                          onTap: _doALike,
                        )),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(children: [
                      IconButton(
                        icon: const Icon(Icons.phone),
                        tooltip: 'Appeler',
                        onPressed: () {
                          // setState(() {
                          //   _volume += 10;
                          // });
                        },
                      ),
                      Text(
                        "Appeler".toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ])),
                    Expanded(
                        child: Column(children: [
                      IconButton(
                        icon: const Icon(Icons.near_me),
                        tooltip: 'Itinéraire',
                        onPressed: () {
                          // setState(() {
                          //   _volume += 10;
                          // });
                        },
                      ),
                      Text(
                        "Itinéraire".toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ])),
                    Expanded(
                        child: Column(children: [
                      IconButton(
                        icon: const Icon(Icons.share),
                        tooltip: 'Share',
                        onPressed: () {
                          // setState(() {
                          //   _volume += 10;
                          // });
                        },
                      ),
                      Text(
                        "Share".toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ])),
                  ],
                )),
            Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.all(20.0),
                    child: Text(
                      'LAnnexe Café est un endroit sympa avec de belles pierres apparentes, un bar en bois, des hauts tabourets avec la reproduction dune célèbre marque de bière et une ambiance comme on les aime dans ce quartier de fêtards du jeudi soir et même de toute la semaine. Retransmission de matchs, mix de DJ, happy-hours de 17h à 21 h, ça bouge et ça samuse. On apprécie aussi cette lumière bleutée qui fait la marque de fabrique de lendroit dans lequel se vit de belles soirées estudiantines. Shooters, tableau des consommations affiché au-dessus du bar à la manière de la restauration rapide et bar pris dassaut, voilà comment LAnnexe assure ambiance dans un quartier surpeuplé de bars.',
                    textAlign: TextAlign.justify,
                ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _doALike,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
