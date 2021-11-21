import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/data/models/news_response.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.dataa,
  }) : super(key: key);
  final NewsItemResponse dataa;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: '${dataa.imagesUrl}',
              height: 100,
              width: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${dataa.author}',
                      style: TextStyle(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 14),
                  Text(
                    '${dataa.description}',
                    maxLines: 3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
