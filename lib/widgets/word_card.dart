// Copyright 2019-2021 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and license details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unnecessary_null_comparison, use_key_in_widget_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pathlexi/data/words.dart';
import 'package:pathlexi/screens/details.dart';
import 'package:pathlexi/style.dart';

class FrostyBackground extends StatelessWidget {
  const FrostyBackground({
    this.color,
    this.intensity = 25,
    this.child,
  });

  final Color? color;
  final double intensity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: intensity, sigmaY: intensity),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}

/// A Card-like Widget that responds to tap events by animating changes to its
/// elevation and invoking an optional [onPressed] callback.
class PressableCard extends StatefulWidget {
  const PressableCard({
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.upElevation = 6,
    this.downElevation = 0,
    this.shadowColor = Colors.black,
    this.duration = const Duration(milliseconds: 100),
    this.onPressed,
    Key? key,
  })  : assert(child != null),
        assert(borderRadius != null),
        assert(upElevation != null),
        assert(downElevation != null),
        assert(shadowColor != null),
        assert(duration != null),
        super(key: key);

  final VoidCallback? onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  PressableCardState createState() => PressableCardState();
}

class PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => cardIsDown = false);
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
        elevation: cardIsDown ? widget.downElevation : widget.upElevation,
        borderRadius: widget.borderRadius,
        shape: BoxShape.rectangle,
        shadowColor: widget.shadowColor,
        duration: widget.duration,
        color: Style.lightBackgroundGrey,
        child: ClipRRect(
          borderRadius: widget.borderRadius,
          child: widget.child,
        ),
      ),
    );
  }
}

class WordCard extends StatelessWidget {
  /// Word to be displayed by the card.
  final Word word;
  final bool horizontal;

  const WordCard(this.word, {this.horizontal = true});

  const WordCard.vertical(this.word) : horizontal = false;

  Widget _buildDetails() {
    var frostyBackground = FrostyBackground(
      color: const Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: word.isFood == true
                  ? const CircleAvatar(
                      backgroundColor: Style.plcGreenTheme,
                      maxRadius: 16.0,
                      child: Icon(
                        Icons.fastfood,
                        color: Style.lightBackgroundGrey,
                        semanticLabel:
                            'Icon indicates food-themed pathology words',
                      ),
                    )
                  : const SizedBox(height: 1),
            ),
            Text(
              word.name!,
              style: Style.cardTitleText,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            Text(
              word.description!,
              style: Style.cardDescriptionText,
            ),
          ],
        ),
      ),
    );
    return frostyBackground;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return PressableCard(
      onPressed: () {
        Navigator.of(context).push<void>(MaterialPageRoute(
          builder: (context) => DetailsScreen(word),
          fullscreenDialog: true,
        ));
      },
      child: Stack(
        children: [
          Semantics(
            label: 'A card background featuring ${word.name}',
            child: Container(
              height: screenSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    word.imageOne!,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildDetails(),
          ),
        ],
      ),
    );
  }
}
