import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/model/NewsResponse.dart';
import 'package:news_app/home/model/SourceResponse.dart';
import 'package:news_app/home/news/news_item.dart';

class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context , snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ),
          );
        }else if (snapshot.hasError){
          return Column(
            children: [
               Text('Something Went wrong'),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id?? '');
                setState(() {
                });
              },
                  child: Text('try agin'))
            ],
          );
        }
        if(snapshot.data!.status != 'ok'){
         return Column(
            children: [
              Text(snapshot.data!.massage!),
              ElevatedButton(onPressed: (){
                ApiManager.getNewsBySourceId(widget.source.id?? '');
                setState(() {
                });
              },
                  child: Text('try agin'))
            ],
          );
        }
        var newsList = snapshot.data!.articles!;
        return Expanded(
          child: ListView.builder(
              itemBuilder: (context, index){
              return  NewsItem(news: newsList[index],);
              },
          itemCount: newsList.length),
        );
        }
        );
  }
}
