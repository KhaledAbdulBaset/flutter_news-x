import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webScreen extends StatelessWidget{
  late String myUrl;
  webScreen(this.myUrl);

final webController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled);
  
  @override
  Widget build(BuildContext context) {
    webController..loadRequest(Uri.parse(myUrl));
    return Scaffold(
      appBar: AppBar(),
      body:WebViewWidget(controller: webController)



    );
  }

}