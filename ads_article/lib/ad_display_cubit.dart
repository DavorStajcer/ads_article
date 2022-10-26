import 'dart:developer';

import 'package:ads_article/ad_display_state.dart';
import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdDisplayCubit extends Cubit<AdDisplayState> {
  AdDisplayCubit() : super(AddNotLoaded());

  Future<void> displayBanner(
    double screenWidth,
  ) async {
    final AdSize inlineAdaptiveAdSize =
        AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(
      screenWidth.truncate(),
    );

    final BannerAd banner = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      size: inlineAdaptiveAdSize,
      request: const AdManagerAdRequest(
        extras: {
          "keywords": "[firstKeyword, secondKeywods]",
        },
      ),
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          emit(
            AdFailedToLoad(
              message: error.message,
            ),
          );
          ad.dispose();
        },
        onAdClosed: null,
        onAdImpression: null,
        onAdOpened: null,
        onAdLoaded: (Ad ad) async {
          log('Ad loaded');
          BannerAd bannerAd = (ad as BannerAd);
          final AdSize? size = await bannerAd.getPlatformAdSize();

          if (isClosed) {
            return;
          }
          if (size == null) {
            emit(
              AdFailedToLoad(
                message: 'Ad loaded but failed to get its size',
              ),
            );
            ad.dispose();
            return;
          }
          emit(AddLoaded(bannerAd, size));
        },
        onAdWillDismissScreen: null,
        onPaidEvent: null,
      ),
    );
    await banner.load();
  }
}
