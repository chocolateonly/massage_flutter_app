import 'dart:ui';

class SizeFit {
  // 1.基本信息
  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;
  static double bottomHeight;

  static double rpx;
  static double px;

  static const double designWidth = 750;

  static void initialize({double standardSize = designWidth}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;

    // 6.底部高度
    bottomHeight = window.padding.bottom;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}


extension DoubleFit on double {
  double get px {
    return SizeFit.setPx(this);
  }

  double get rpx {
    return SizeFit.setRpx(this);
  }
}

extension IntFit on int {
  double get px {
    return SizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return SizeFit.setRpx(this.toDouble());
  }
}


