import 'package:flutter/material.dart';
import 'package:pathlexi/style.dart';

class AboutCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AboutCard({
    this.child,
    this.color,
    this.splashColor,
  });
  final Widget? child;
  final Color? color;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Material(
        color: color,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(10.0),
        shadowColor: Style.shadowColor,
        child: InkWell(
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(13.0),
          child: child,
        ),
      ),
    );
  }
}
