import 'package:ads_article/ad_display_cubit.dart';
import 'package:ads_article/ads_in_lisit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeExample extends StatelessWidget {
  const HomeExample({Key? key}) : super(key: key);

  static const int adGap = 5;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) => index % (adGap + 1) == 0
            ? BlocProvider(
                create: (context) => AdDisplayCubit(),
                child: AdsInList(
                  screenWidth: screenWidth,
                  index: index,
                ),
              )
            : Container(
                height: 400,
                color: index % 2 == 0 ? Colors.black : Colors.blue,
              ),
      ),
    );
  }
}
