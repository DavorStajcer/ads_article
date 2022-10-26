import 'package:google_mobile_ads/google_mobile_ads.dart';

abstract class AdDisplayState {}

class AddNotLoaded extends AdDisplayState {}

class AddLoaded extends AdDisplayState {
  final AdWithView bannerAd;
  final AdSize size;

  AddLoaded(this.bannerAd, this.size);
}

class AdFailedToLoad extends AdDisplayState {
  final String? message;

  AdFailedToLoad({
    this.message,
  });
}
