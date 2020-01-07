import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imgPath;
  final double imgSize;
  const CircleImage(this.imgPath, this.imgSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imgSize,
      height: imgSize,
      child: CachedNetworkImage(
        imageUrl: imgPath,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
                
                //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
              ),
          ),
        ),
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

/*
Container(
      width: imgSize,
      height: imgSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF32003D),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            imgPath
          ),
        ),
      ),
    );
*/
