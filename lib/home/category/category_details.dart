import 'package:flutter/material.dart';
import 'package:news_app/home/model/category.dart';

import '../../api/api_manager.dart';
import '../../app_colors.dart';
import '../model/SourceResponse.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
 Category category;
 CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: Text('Try Again'))
            ],
          );
        }

        ///server => success , error
        if (snapshot.data!.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.category.id);
                    setState(() {});
                  },
                  child: Text('Try Again'))
            ],
          );
        }
        var sourceList = snapshot.data!.sources!;
        return TabWidget(sourceList: sourceList);
        //ListView.builder(
        //   itemBuilder: (context, index) {
        //     return Text(sourceList[index].name ?? '');
        //   },
        //   itemCount: sourceList.length,
        // );
      },
    );
  }
}
