import '../shared/screen_fit.dart';

extension IntFit on int {
  double get px {
    return SKScreenFit.setPx(this.toDouble());
  }

  double get rpx {
    return SKScreenFit.setRpx(this.toDouble());
  }
}