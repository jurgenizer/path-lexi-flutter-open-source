// Copyright 2019-2020 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and license details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:pathlexi/style.dart';

/// Partially overlays and then blurs its child's background - not anymore - Jurgen
class OldFrostedBox extends StatelessWidget {
  const OldFrostedBox({
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        color: Style.searchIconColor,
      ),
    );
  }
}

/// An Icon that implicitly animates changes to its color.
class ColorChangingIcon extends ImplicitlyAnimatedWidget {
  const ColorChangingIcon(
    this.icon, {
    this.color = Style.errorSnackBarColor,
    this.size,
    required Duration duration,
    Key? key,
  }) : super(key: key, duration: duration);

  final Color color;

  final IconData icon;

  final double? size;

  @override
  ColorChangingIconState createState() => ColorChangingIconState();
}

class ColorChangingIconState
    extends AnimatedWidgetBaseState<ColorChangingIcon> {
  ColorTween? _colorTween;

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      semanticLabel: 'Close button',
      size: widget.size,
      color: _colorTween?.evaluate(animation),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(
      _colorTween,
      widget.color,
      (dynamic value) => ColorTween(begin: value as Color?),
    ) as ColorTween?;
  }
}

/// A simple "close this modal" button that invokes a callback when pressed.
class ClosedButton extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ClosedButton(this.onPressed);

  final VoidCallback onPressed;

  @override
  ClosedButtonState createState() {
    return ClosedButtonState();
  }
}

class ClosedButtonState extends State<ClosedButton> {
  bool tapInProgress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() => tapInProgress = true);
      },
      onTapUp: (details) {
        setState(() => tapInProgress = false);
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() => tapInProgress = false);
      },
      child: ClipOval(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blueGrey[100],
          ),
          child: Center(
            child: ColorChangingIcon(
              Icons.clear,
              duration: const Duration(milliseconds: 300),
              color: tapInProgress
                  ? Style.closedButtonPressed
                  : Style.closedButtonUnpressed,
              size: 21,
            ),
          ),
        ),
      ),
    );
  }
}
