// Copyright 2019-2020 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and license details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:pathlexi/data/words.dart';
import 'package:pathlexi/screens/details.dart';
import 'package:pathlexi/style.dart';

class ZoomClipAssetImage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ZoomClipAssetImage(
      {required this.zoom, this.height, this.width, required this.imageAsset});

  final double zoom;
  final double? height;
  final double? width;
  final String? imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: OverflowBox(
          maxHeight: height! * zoom,
          maxWidth: width! * zoom,
          child: Image.asset(
            imageAsset!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class WordHeadline extends StatelessWidget {
  final Word word;

  // ignore: use_key_in_widget_constructors
  const WordHeadline(this.word);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push<void>(MaterialPageRoute(
        builder: (context) => DetailsScreen(word),
        fullscreenDialog: true,
      )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZoomClipAssetImage(
            imageAsset: word.imageOne,
            zoom: 2.0,
            height: 72,
            width: 72,
          ),
          const SizedBox(width: 8),
          Flexible(
            fit: FlexFit.loose,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.name!,
                  style: Style.headlineName,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  //maxLines: 1,
                ),
                Text(
                  word.description!,
                  style: Style.headlineDescription,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
