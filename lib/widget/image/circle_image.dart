import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double? widthImg;
  final double? heightImg;
  final double? borderRadius;
  final String? urlImg;

  const CircleImage(
      {Key? key,
      @required this.widthImg,
      @required this.heightImg,
      @required this.borderRadius,
      @required this.urlImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: CachedNetworkImage(
          width: widthImg,
          height: heightImg,
          fit: BoxFit.fill,
          imageUrl: urlImg ?? '',
          placeholder: (context, url) => Image.asset(
                'images/avatar.png',
                fit: BoxFit.cover,
              ),
          errorWidget: (context, url, error) => Image.asset(
                'images/avatar.png',
                fit: BoxFit.cover,
              )),
    );
  }
}