/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsGifsGen {
  const $AssetsGifsGen();

  /// File path: assets/Gifs/SecurityOn.gif
  AssetGenImage get securityOn =>
      const AssetGenImage('assets/Gifs/SecurityOn.gif');

  /// File path: assets/Gifs/onbroading_one.gif
  AssetGenImage get onbroadingOne =>
      const AssetGenImage('assets/Gifs/onbroading_one.gif');

  /// File path: assets/Gifs/onbroading_three.gif
  AssetGenImage get onbroadingThree =>
      const AssetGenImage('assets/Gifs/onbroading_three.gif');

  /// File path: assets/Gifs/onbroading_two.gif
  AssetGenImage get onbroadingTwo =>
      const AssetGenImage('assets/Gifs/onbroading_two.gif');

  /// List of all assets
  List<AssetGenImage> get values =>
      [securityOn, onbroadingOne, onbroadingThree, onbroadingTwo];
}

class $AssetsCardsGen {
  const $AssetsCardsGen();

  /// File path: assets/cards/mastercard.png
  AssetGenImage get mastercard =>
      const AssetGenImage('assets/cards/mastercard.png');

  /// File path: assets/cards/paionner.png
  AssetGenImage get paionner =>
      const AssetGenImage('assets/cards/paionner.png');

  /// File path: assets/cards/paypal.png
  AssetGenImage get paypal => const AssetGenImage('assets/cards/paypal.png');

  /// File path: assets/cards/skrill.png
  AssetGenImage get skrill => const AssetGenImage('assets/cards/skrill.png');

  /// File path: assets/cards/visa.png
  AssetGenImage get visa => const AssetGenImage('assets/cards/visa.png');

  /// File path: assets/cards/visa_white.png
  AssetGenImage get visaWhite =>
      const AssetGenImage('assets/cards/visa_white.png');

  /// File path: assets/cards/visa_yellow.png
  AssetGenImage get visaYellow =>
      const AssetGenImage('assets/cards/visa_yellow.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [mastercard, paionner, paypal, skrill, visa, visaWhite, visaYellow];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/DeepFake_Logo.svg
  String get deepFakeLogo => 'assets/images/DeepFake_Logo.svg';

  /// File path: assets/images/check_circle.svg
  String get checkCircle => 'assets/images/check_circle.svg';

  /// File path: assets/images/francais.jpg
  AssetGenImage get francais =>
      const AssetGenImage('assets/images/francais.jpg');

  /// File path: assets/images/identity_card.svg
  String get identityCard => 'assets/images/identity_card.svg';

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/x_circle.svg
  String get xCircle => 'assets/images/x_circle.svg';

  /// List of all assets
  List<dynamic> get values => [
        deepFakeLogo,
        checkCircle,
        francais,
        identityCard,
        onboarding1,
        onboarding2,
        onboarding3,
        xCircle
      ];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logos/logo.png');

  /// File path: assets/logos/slogan.png
  AssetGenImage get slogan => const AssetGenImage('assets/logos/slogan.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, slogan];
}

class Assets {
  Assets._();

  static const $AssetsGifsGen gifs = $AssetsGifsGen();
  static const $AssetsCardsGen cards = $AssetsCardsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
