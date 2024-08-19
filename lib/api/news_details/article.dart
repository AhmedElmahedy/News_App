import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/model/NewsResponse.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatelessWidget {
  final String url;
  News news ;
  Article({required this.url , required this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //   title: Text(news.author ?? '',
      //   style: Theme.of(context).textTheme.titleLarge,),
      // ),
      body: WebView(
        initialUrl: url ,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}