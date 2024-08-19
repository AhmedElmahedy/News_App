import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/model/NewsResponse.dart';
import 'package:news_app/home/news_details/news_details.dart';

class NewsItem extends StatefulWidget {
  News news;
  NewsItem({required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
          InkWell(
            onTap: (){
             Navigator.push(context,
                 MaterialPageRoute(
                     builder: (Context) => NewsDetails(news: widget.news)));
              setState(() {});
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.fill,
                imageUrl: widget.news.urlToImage ?? '',
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.news.author ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.greyColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.news.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.news.publishedAt ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.greyColor,
                ),
            textAlign: TextAlign.end,
          ),
        ])
        // Container(
        //   clipBehavior: Clip.antiAlias,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   child: Image.network(news.urlToImage ?? ''),
        // )
        );
  }
}
