import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/category/category_fragment.dart';
import 'package:news_app/home/drawer/home_drawer.dart';
import 'package:news_app/home/model/category.dart';
import 'package:news_app/home/settings/settings_tabs.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search))
            ],
            title:
                Text(selectedMenuItem == HomeDrawer.settings ? 'Settings' :
                    selectedCategory == null ?
                    'News App':selectedCategory!.title,
                    style: Theme.of(context).textTheme.titleLarge),
          ),
          
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick ,),
          ),
          body: selectedMenuItem == HomeDrawer.settings? SettingsTabs()
                :
          selectedCategory == null ?
          CategoryFragment(onCategoryItemClick: onCategoryItemClick,)
              :
              CategoryDetails(category: selectedCategory!,)
          //CategoryDetails(),
        ),
      ],
    );
  }
  Category? selectedCategory;
  void onCategoryItemClick(Category newCategory){
    selectedCategory = newCategory;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSideMenuItem){
    selectedMenuItem = newSideMenuItem;
    selectedCategory =null;
    Navigator.pop(context);
    setState(() {

    });
  }
}