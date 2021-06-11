import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_simulador_parcela/app/views/page_template.dart';
import 'package:webview_flutter/webview_flutter.dart';

//https://api.flutter.dev/flutter/widgets/IndexedStack-class.html
//https://pub.dev/packages/webview_flutter/example

class WebViewScreen extends StatefulWidget {
  String url;

  WebViewScreen({required this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  /*final Completer<WebViewController> _controllerWebView =
      Completer<WebViewController>();*/

  final _key = UniqueKey();

  int _position = 1;

  WebViewController? _controllerWebView;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return templatePage(
        widgetMaster: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: IndexedStack(
        index: _position,
        children: [
          WebView(
              key: _key,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finished) {
                setState(() {
                  _position = 0;
                });
              },
              onPageStarted: (started) {
                setState(() {
                  _position = 1;
                });
              },
              onWebViewCreated: (WebViewController webViewController) {
                _controllerWebView = webViewController;
              }),
          Center(child: CircularProgressIndicator())
        ],
      ),
    ));
  }
}
