import 'package:ads_article/home_example.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AdsArticle());
}

class AdsArticle extends StatelessWidget {
  const AdsArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeExample(),
    );
  }
}
