import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/model/SourceResponse.dart';
import 'package:news_app/home/news/news_item.dart';
import 'package:news_app/home/news/cubit/news_state.dart';
import 'package:news_app/home/news/cubit/news_widget_view_model.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsWidgetViewModel, NewsState>(
        bloc: viewModel..getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if (state is NewsErrorState) {
            return Column(
              children: [
                Text(state.massage),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id ?? '');
                    },
                    child: const Text('try again'))
              ],
            );
          } else if (state is NewsSuccessState) {
            return Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(
                      news: state.newsList[index],
                    );
                  },
                  itemCount: state.newsList.length),
            );
          } else {
            return Container();
          }
        });
  }
}
