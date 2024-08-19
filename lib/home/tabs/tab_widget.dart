import 'package:flutter/material.dart';
import 'package:news_app/home/model/SourceResponse.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/tabs/tab_item.dart';
class TabWidget extends StatefulWidget {
 List <Source> sourceList;

 TabWidget({required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
 int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length ,    //sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap:(index){
                selectedIndex = index;
                setState(() {
            
                });
              } ,
              isScrollable: true,
                automaticIndicatorColorAdjustment: false,
               indicatorColor: Colors.transparent,
              tabs: widget.sourceList.map((source)=> TabItem(
                  isSelected: selectedIndex == widget.sourceList.indexOf(source) ,
                  source: source)).toList()
            
            ),
            NewsWidget(source: widget.sourceList[selectedIndex])
          ],
        )
    );
  }
}
