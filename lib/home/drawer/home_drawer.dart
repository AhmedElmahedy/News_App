import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
Function onSideMenuItemClick;
HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          color: AppColors.primaryLightColor,
          child: Center(child: Text('News App!',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 28
          ),)),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(width: 10,),
                Text('Categories',
                style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 10,),
                Text('Settings',
                style: Theme.of(context).textTheme.titleMedium,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
