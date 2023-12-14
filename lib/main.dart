import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

int red = 15;
int green = 40;
int blue = 139;

Color appBarColor = Color.fromRGBO(red, green, blue, 1.0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyWebview extends StatelessWidget {
  final String url;

  const MyWebview({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
          'Welcome to Lesaffre HR Fiori System!',
        style: TextStyle(
          fontSize: 15,
        ),),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(191, 210, 231, 1.0),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(
            'Welcome! Please select a system',
        style: TextStyle(fontSize: 19),),
      ),
      body: Center(
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: appBarColor,
              shadowColor: Colors.blue,
            ).merge(ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(150, 50))
            )),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyWebview(url:'https://hr.lesaffre.com.tr')),
              );
              if (kDebugMode) {
                print('Button Pressed!');
              }
            }, child: const Text(
            'HR Production System',
            style: TextStyle(
              fontSize: 20.0,
            ),),
          ),
        ),
      );
  }
}







