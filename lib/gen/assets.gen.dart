/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bank_icon.png
  AssetGenImage get bankIcon =>
      const AssetGenImage('assets/images/bank_icon.png');

  /// File path: assets/images/cart_icon.png
  AssetGenImage get cartIcon =>
      const AssetGenImage('assets/images/cart_icon.png');

  /// File path: assets/images/credit_icon.png
  AssetGenImage get creditIcon =>
      const AssetGenImage('assets/images/credit_icon.png');

  /// File path: assets/images/delici.png
  AssetGenImage get delici => const AssetGenImage('assets/images/delici.png');

  /// File path: assets/images/feo.png
  AssetGenImage get feo => const AssetGenImage('assets/images/feo.png');

  /// File path: assets/images/gr_3.png
  AssetGenImage get gr3 => const AssetGenImage('assets/images/gr_3.png');

  /// File path: assets/images/group66.png
  AssetGenImage get group66 => const AssetGenImage('assets/images/group66.png');

  /// File path: assets/images/hat_img.png
  AssetGenImage get hatImg => const AssetGenImage('assets/images/hat_img.png');

  /// File path: assets/images/heart_icon.png
  AssetGenImage get heartIcon =>
      const AssetGenImage('assets/images/heart_icon.png');

  /// File path: assets/images/history_icon.png
  AssetGenImage get historyIcon =>
      const AssetGenImage('assets/images/history_icon.png');

  /// File path: assets/images/home_icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/images/home_icon.png');

  /// File path: assets/images/no_cart_icon.png
  AssetGenImage get noCartIcon =>
      const AssetGenImage('assets/images/no_cart_icon.png');

  /// File path: assets/images/no_history_icon.png
  AssetGenImage get noHistoryIcon =>
      const AssetGenImage('assets/images/no_history_icon.png');

  /// File path: assets/images/no_wifi_icon.png
  AssetGenImage get noWifiIcon =>
      const AssetGenImage('assets/images/no_wifi_icon.png');

  /// File path: assets/images/paypal_icon.png
  AssetGenImage get paypalIcon =>
      const AssetGenImage('assets/images/paypal_icon.png');

  /// File path: assets/images/person1_img.png
  AssetGenImage get person1Img =>
      const AssetGenImage('assets/images/person1_img.png');

  /// File path: assets/images/person2_img.png
  AssetGenImage get person2Img =>
      const AssetGenImage('assets/images/person2_img.png');

  /// File path: assets/images/rectangle3.png
  AssetGenImage get rectangle3 =>
      const AssetGenImage('assets/images/rectangle3.png');

  /// File path: assets/images/rectangle4.png
  AssetGenImage get rectangle4 =>
      const AssetGenImage('assets/images/rectangle4.png');

  /// File path: assets/images/rectangle5.png
  AssetGenImage get rectangle5 =>
      const AssetGenImage('assets/images/rectangle5.png');

  /// File path: assets/images/search_icon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/images/search_icon.png');

  /// File path: assets/images/shopping-cart.png
  AssetGenImage get shoppingCart =>
      const AssetGenImage('assets/images/shopping-cart.png');

  /// File path: assets/images/user_icon.png
  AssetGenImage get userIcon =>
      const AssetGenImage('assets/images/user_icon.png');

  /// File path: assets/images/vector.png
  AssetGenImage get vector => const AssetGenImage('assets/images/vector.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bankIcon,
        cartIcon,
        creditIcon,
        delici,
        feo,
        gr3,
        group66,
        hatImg,
        heartIcon,
        historyIcon,
        homeIcon,
        noCartIcon,
        noHistoryIcon,
        noWifiIcon,
        paypalIcon,
        person1Img,
        person2Img,
        rectangle3,
        rectangle4,
        rectangle5,
        searchIcon,
        shoppingCart,
        userIcon,
        vector
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
