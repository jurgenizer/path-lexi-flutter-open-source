// Copyright 2019 - 2022 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and license details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pathlexi/data/words.dart';
import 'package:pathlexi/style.dart';
import 'package:pathlexi/widgets/closed_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

class DetailsScreen extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  final Word word;

  DetailsScreen(this.word, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              left: true,
              top: true,
              right: true,
              bottom: false,
              minimum: const EdgeInsets.fromLTRB(18.0, 14.0, 18.0, 0.0),
              child: _buildHeader(context),
            ),
            Expanded(
              child: _getContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Container _getContent(BuildContext context) {
    int h = 0;
    int i = 0;
    String? compareToOneWord = 'Circumscribed';
    String? compareToTwoWord = 'Variegated';

    compareToOneWord = word.compareToOne;
    compareToTwoWord = word.compareToTwo;

    return Container(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[100],
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(3.0),
                          bottom: Radius.circular(0.0))),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: const Text(
                          'isiXhosa:',
                          style: Style.detailsDescriptionBoldText,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          word.xhosa!,
                          textAlign: TextAlign.end,
                          style: Style.detailsTranslationText,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown[100],
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(0.0),
                        bottom: Radius.circular(3.0)),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: const Text(
                          'Afrikaans:',
                          style: Style.detailsDescriptionBoldText,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          word.afrikaans!,
                          textAlign: TextAlign.end,
                          style: Style.detailsTranslationText,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  word.description!,
                  style: Style.detailsDescriptionText,
                ),
                //MARK Visibility compareToOne starts
                Visibility(
                  visible: (word.compareToOne != ""),
                  replacement: const SizedBox(height: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 3),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0))),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        onPressed: () {
                          /*...*/
                          var specialWordOne = Word.words
                              .singleWhere((v) => v.name == compareToOneWord);
                          h = Word.words.indexOf(specialWordOne);
                          /*...*/
                          Navigator.of(context).pop();
                          Navigator.of(context).push<void>(MaterialPageRoute(
                            builder: (context) => DetailsScreen(Word.words[h]),
                            fullscreenDialog: true,
                          ));
                        },
                        child: Text(
                          "Compare to: ${word.compareToOne}",
                          style: Style.compareToButtonText,
                        ),
                      ),
                      const SizedBox(height: 1),
                    ],
                  ),
                ),
                //MARK Visibility compareToOne ends
                //MARK Visibility compareToTwo starts
                Visibility(
                  visible: (word.compareToTwo != ""),
                  replacement: const SizedBox(height: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 1),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.0))),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        onPressed: () {
                          /*...*/
                          var specialWordTwo = Word.words
                              .singleWhere((v) => v.name == compareToTwoWord);
                          i = Word.words.indexOf(specialWordTwo);
                          /*...*/
                          Navigator.of(context).pop();
                          Navigator.of(context).push<void>(MaterialPageRoute(
                            builder: (context) => DetailsScreen(Word.words[i]),
                            fullscreenDialog: true,
                          ));
                        },
                        child: Text(
                          "Compare to: ${word.compareToTwo}",
                          style: Style.compareToButtonText,
                        ),
                      ),
                      const SizedBox(height: 3),
                    ],
                  ),
                ),
                //MARK Visibility compareToTwo ends
                Text(
                  word.used!,
                  style: Style.detailsUsedText,
                ),
                const SizedBox(height: 12),
                _getImageOne(context),
                const SizedBox(height: 8),
                Text(
                  word.captionOne!,
                  style: Style.detailsImageCaptionText,
                ),
                Visibility(
                  visible: (word.imageTwo != ""),
                  replacement: const SizedBox(height: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 12),
                      _getImageTwo(context),
                      const SizedBox(height: 8),
                      Text(
                        word.captionTwo!,
                        style: Style.detailsImageCaptionText,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//MARK: header
  Widget _buildHeader(BuildContext context) {
    Future _speak() async {
      String? utterance = "Hello";
      // utterance ??= "Hello";
      //print("The word's name is ${word.name}");

      utterance = word.name;
      //print("The utterance is $utterance");
      // print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("en-ZA");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.43);

      await flutterTts.speak(utterance!);
    }

    Future _stop() async {
      await flutterTts.stop();
    }

    return Container(
        padding: const EdgeInsets.fromLTRB(0, 2, 0, 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //
                  Text(
                    word.name!,
                    style: Style.detailsTitleText,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    softWrap: true,
                    maxLines: 2,
                    key: const ValueKey('detail-name-text'),
                  ),
                  //
                  ActionChip(
                      avatar: const CircleAvatar(
                        //backgroundColor: Colors.grey.shade800,
                        backgroundColor: Style.plcGreenTheme,
                        child: Icon(
                          Icons.hearing,
                          color: Style.lightBackgroundGrey,
                          semanticLabel: 'Press to hear the word',
                        ),
                      ),
                      label: const Text('Hear it'),
                      padding: const EdgeInsets.all(3),
                      onPressed: () {
                        //print("ActionChip pressed, speak!");
                        _speak();
                      })
                ],
              ),
            ),
            const Spacer(flex: 1),
            SizedBox(
              width: 36,
              height: 36,
              child: ClosedButton(() {
                _stop();
                Navigator.of(context).pop();
              }),
            ),
          ],
        ));
  }

  Container _getImageOne(context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
        constraints: BoxConstraints.expand(
          height: screenSize.width,
        ),
        padding: const EdgeInsets.only(
            left: 16.0, top: 8.0, bottom: 8.0, right: 16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              word.imageOne!,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                launch(
                    'https://digitalpathology.uct.ac.za/case_detail.php?case_id=${word.caseIDOne}');
              },
            ),
            const Positioned(
              top: 0.1,
              right: 0.1,
              child: Icon(
                Icons.touch_app,
                size: 32.0,
                color: Style.lightBackgroundGrey,
              ),
            ),
          ],
        ));
  }

  Container _getImageTwo(context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
        constraints: BoxConstraints.expand(
          height: screenSize.width,
        ),
        padding: const EdgeInsets.only(
            left: 16.0, top: 8.0, bottom: 8.0, right: 16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              word.imageTwo!,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                launch(
                    'https://digitalpathology.uct.ac.za/case_detail.php?case_id=${word.caseIDTwo}');
              },
            ),
            const Positioned(
              top: 0.1,
              right: 0.1,
              child: Icon(
                Icons.touch_app,
                size: 32.0,
                color: Style.lightBackgroundGrey,
              ),
            ),
          ],
        ));
  }
}
