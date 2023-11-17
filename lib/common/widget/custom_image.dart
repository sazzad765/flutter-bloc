import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage(
      {Key? key,
      required this.imageUrl,
      this.defaultImage,
      this.height,
      this.width,
      this.fit})
      : super(key: key);
  final String? defaultImage;
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(defaultImage ?? 'assets/images/pecado_pecat.png');
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const SizedBox(
            height: 100,
            child: Center(
              child: Text('loading...'),
            ),
          );
        },
      ),
    );

    // FadeInImage.assetNetwork(
    //   placeholder: defaultImage ?? 'assets/images/pecado_pecat.png',
    //   image: imageUrl);
  }
}
