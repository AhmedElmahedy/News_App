import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class SettingsTabs extends StatelessWidget {
  const SettingsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:  EdgeInsets.all(15),
          child: Text('Languages',
          style: Theme.of(context).textTheme.titleMedium,),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryLightColor,
            width: 2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('English',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.primaryLightColor
              ),),
              Icon(Icons.keyboard_arrow_down,
              color: AppColors.primaryLightColor,)
            ],
          ),
        ),
      ],
    );
  }
}
