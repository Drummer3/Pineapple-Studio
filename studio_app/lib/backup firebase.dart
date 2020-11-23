import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pineapple Studio',
      home: MyHomePage(title: 'Pineapple Studio'),
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
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.black12,
          title: Text(
            widget.title,
            style: TextStyle(fontSize: 25.0),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.info),
              tooltip: 'Info',
              onPressed: () {
                infoPage(context);
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              child: FlatButton(
                color: Colors.red[700],
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: _launchLIVE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(
                  "Join our YouTube stream ",
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              child: FlatButton(
                color: Colors.blue[700],
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: _launchARCHIVE,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(
                  "Live Stream Archive", //https://www.youtube.com/playlist?list=PLajrKdO6drP0mfdu6xR1EK1MhlT98w5H3
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

void infoPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text('Info Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                child: new FlatButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  onPressed: () => launch("tel://+995591080888"),
                  child: Text(
                    'Call Us',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                child: new FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  onPressed: () => launch("mailto:drummerthree@gmail.com"),
                  child: Text(
                    'Mail Us',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 100,
                child: new FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  onPressed: () =>
                      launch("https://www.facebook.com/pineapplestudiogeo"),
                  child: Text(
                    'Our Facebook',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ));
}

_launchLIVE() async {
  const url = 'https://www.youtube.com/channel/UCrL3KpttwGom6-JWiH2_9VQ/live';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchARCHIVE() async {
  const url =
      'https://www.youtube.com/playlist?list=PLajrKdO6drP0mfdu6xR1EK1MhlT98w5H3';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
