import '../shared/screen_fit.dart';

extension DoubleFit on double {
  double get px {
    return SKScreenFit.setPx(this);
  }

  double get rpx {
    return SKScreenFit.setRpx(this);
  }
}
