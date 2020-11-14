import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  BannerImage(this.url, {this.fit: BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.circular(8),
      child: CachedNetworkImage(
          imageUrl: ImageHelper.wrapUrl(url),
          placeholder: (context, url) =>
              Center(child: CupertinoActivityIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover),
    );
  }
}
