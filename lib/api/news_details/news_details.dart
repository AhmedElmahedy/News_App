import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/news_details/article.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/model/NewsResponse.dart';

class NewsDetails extends StatefulWidget {
  News news;
  NewsDetails({required this.news});
  static const String routeName = 'News Details';
  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}
class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news.author ?? 'News Title',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.fill,
                  imageUrl: widget.news.urlToImage ?? '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                widget.news.author ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.greyColor),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                widget.news.title ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                widget.news.publishedAt ?? '',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.greyColor,
                    ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              Text(
                widget.news.content ?? '',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01,
                    left: MediaQuery.of(context).size.width * 0.45),
                child: TextButton(
                  onPressed: () {
                    if (widget.news.url != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Article(
                                    url: widget.news.url!,
                                    news: widget.news,
                                  )));
                    }
                  },
                  child: Row(
                    children: [
                       Text(
                        'View Full Article',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.greyColor
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                       Icon(Icons.play_arrow,
                      color: AppColors.greyColor,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
