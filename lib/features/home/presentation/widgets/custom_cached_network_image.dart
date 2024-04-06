
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCahedNetworkImage extends StatelessWidget 
{
  const CustomCahedNetworkImage({super.key ,required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) 
  {
    return  CachedNetworkImage(
  imageUrl: imageUrl,
  // width: 100.0,
  // height: 100.0,
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
              )),
    
  ),
  placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
  errorWidget: (context, url, error) =>  const Center(child:   Icon(Icons.error)),
);
  }
}