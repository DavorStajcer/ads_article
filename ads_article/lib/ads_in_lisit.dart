import 'dart:developer';

import 'package:ads_article/ad_display_cubit.dart';
import 'package:ads_article/ad_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsInList extends StatefulWidget {
  final double screenWidth;
  final int index;
  const AdsInList({
    Key? key,
    required this.screenWidth,
    required this.index,
  }) : super(key: key);

  @override
  State<AdsInList> createState() => _AdsInListState();
}

class _AdsInListState extends State<AdsInList>
    with AutomaticKeepAliveClientMixin {
  late AdDisplayCubit _adDisplayCubit;

  @override
  void initState() {
    _adDisplayCubit = BlocProvider.of<AdDisplayCubit>(context)
      ..displayBanner(widget.screenWidth);
    super.initState();
  }

  @override
  void dispose() {
    log('disposing ${widget.index}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdDisplayCubit, AdDisplayState>(
      bloc: _adDisplayCubit,
      builder: (context, adDisplayState) {
        log('Ad builder index ${widget.index}, adDisplayState $adDisplayState');

        if (adDisplayState is AddNotLoaded) {
          return const SizedBox();
        }
        if (adDisplayState is AdFailedToLoad) {
          return SizedBox(
            height: 200,
            child: Center(
              child: Text(
                adDisplayState.message ?? 'Ad failed to load',
              ),
            ),
          );
        }

        final adLoaded = adDisplayState as AddLoaded;

        return SizedBox(
          height: adLoaded.size.height.toDouble(),
          width: adLoaded.size.width.toDouble(),
          child: AdWidget(
            ad: adLoaded.bannerAd,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
