import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

abstract class Style {
  static const headlineText = TextStyle(
    color: Color(0xff415d56),
    fontFamily: 'OpenSansCondensed',
    fontSize: 38,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const minorText = TextStyle(
    color: Color.fromRGBO(128, 128, 128, 1),
    fontFamily: 'NotoSans',
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const headlineName = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'OpenSansCondensed',
    fontSize: 21,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const headlineDescription = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const cardTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'OpenSansCondensed',
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const cardCategoryText = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const cardDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 15,
    //fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'OpenSansCondensed',
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsUsedText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.6),
    fontFamily: 'NotoSans',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const includeFoodTermsText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.6),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTranslationsHeaderText = TextStyle(
    color: Color.fromRGBO(176, 176, 176, 1),
    fontFamily: 'NotoSans',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsDescriptionBoldText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsTranslationText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsImageCaptionText = TextStyle(
    color: Color.fromRGBO(176, 176, 176, 1),
    fontFamily: 'NotoSans',
    fontSize: 15,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
  );

  static const submitFeedbackButtonText = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const compareToButtonText = TextStyle(
    color: Color.fromRGBO(128, 128, 128, 1),
    fontFamily: 'NotoSans',
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const appBackground = Color(0xfff0f0f0);

  static const plcGreenTheme = Color(0xff415d56);

  static const scaffoldBackground = Color(0xfff0f0f0);

  static const searchBackground = Color(0xffe0e0e0);

  static const frostedBackground = Color(0xccf8f8f8);

  static const lightBackgroundGrey = Color(0xFFE5E5EA);

  static const darkBackgroundGrey = Color(0xff808080);

  static const closedButtonUnpressed = Color(0xff808080);

  static const defaultGreyUI = Color(0xff808080);

  static const closedButtonPressed = Color(0xff415d56);

  static const transparentColor = Color(0x00000000);

  static const shadowColor = Color(0xa0000000);

  static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);
  static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
  static const successSnackBarColor = Color(0xff26a69a);
  static const errorSnackBarColor = Color(0xffe57373);

  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle referenceText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontFamily: 'NotoSans',
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const ColorFilter desaturatedColorFilter =
      // 222222 is a random color that has low color saturation.
      ColorFilter.mode(Color(0xFF222222), BlendMode.saturation);
}
