import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageReplacer extends StatelessWidget {
  const ImageReplacer({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.placeholder,
    this.errorWidget,
    this.placeholderUrl, this.isCircle = false,
  });

  final String imageUrl;
  final String? placeholderUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final bool? isCircle;


  @override
  Widget build(BuildContext context) {
    // return CachedNetworkImage(
    //
    //   imageUrl: imageUrl,
    //   width: width,
    //   height: height,
    //   placeholder: (context, _) {
    //     return Image.asset(
    //       "assets/images/loading1.gif",
    //       fit: fit ?? BoxFit.cover,
    //     );
    //   },
    //   errorWidget: (context, e, _) {
    //     return Image.asset(
    //       placeholderUrl ?? "assets/images/loading1.gif",
    //       fit: fit ?? BoxFit.cover,
    //     );
    //   },
    //   fit: fit,
    // );
    return Container(
      width: width,
      height: height,
      decoration: isCircle! ? BoxDecoration(
        shape: BoxShape.circle ,
        border: Border.all(
          color: Colors.transparent, // Border color
          width: 2.0, // Border width
        ),
      ):null,
      child: ClipOval(
        clipBehavior: isCircle! ? Clip.antiAliasWithSaveLayer :   Clip.none,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          placeholder: (context, _) {
            return Image.asset(
              "assets/images/loading1.gif",
              fit: fit ?? BoxFit.cover,
              width: width,
              height: height,
            );
          },
          errorWidget: (context, e, _) {
            return Image.asset(
              placeholderUrl ?? "assets/images/loading1.gif",
              fit: fit ?? BoxFit.cover,
              width: width,
              height: height,
            );
          },
          fit: fit,
        ),
      ),
    );

  }
}

//
