import 'package:flutter/material.dart' as M;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

abstract class Images {
  //
  static const emptyCart = 'assets/imgs/vectors/empty_cart.png';

  static const emptyFav = 'assets/imgs/vectors/empty_fav.png';
}

abstract class Icons {
  //
  static const store = 'assets/icons/store.png';
}

class Image extends M.StatelessWidget {
  //
  final String path;

  final double? height;

  final double? width;

  final Color? color;

  final BoxFit fit;

  const Image({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
  });

  const Image.icon({
    super.key,
    required this.path,
    double size = 24.0,
    this.color,
  })  : height = size,
        width = size,
        fit = BoxFit.contain;

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.asset(
      path,
      fit: fit,
      width: width,
      color: color,
      height: height,
    );
  }
}

class NetworkImage extends M.StatelessWidget {
  //
  final String url;

  final BoxFit? fit;

  const NetworkImage({
    super.key,
    required this.url,
    this.fit,
  });

  @override
  M.Widget build(M.BuildContext context) {
    return M.Image.network(
      url,
      fit: fit,
    );
  }
}
