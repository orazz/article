import 'package:flutter/material.dart';
import 'package:task/article/article_screen.dart';
import 'package:task/utils/colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: ThemeData(
        fontFamily: 'Radiate-Sans',
        primaryColor: AppColors.BACK,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      home: ArticleScreen(),
    );
  }
}
