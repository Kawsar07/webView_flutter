import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main (){
  runApp(MaterialApp(home : MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WebViewController _controller ;
  _goBack()async{
    if(await _controller.canGoBack()){
      await _controller.goBack();

    }
  }
  _forward()async{
    if (await _controller.canGoForward()){
      await _controller.canGoForward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Youtube'),
      centerTitle: true,
        actions: [
          IconButton(onPressed: _goBack, icon: Icon(Icons.arrow_back_ios)),
          IconButton(onPressed: _forward, icon: Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://www.youtube.com/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller = webViewController ;
          },
        ),
      ),
    );
  }
}
