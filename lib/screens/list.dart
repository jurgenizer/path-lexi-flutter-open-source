// Copyright 2019 - 2022 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and license details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pathlexi/data/app_state.dart';
import 'package:pathlexi/style.dart';
import 'package:pathlexi/data/words.dart';
import 'package:pathlexi/widgets/word_card.dart';
import 'package:scoped_model/scoped_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool _food = true;

  Widget _generateWordRow(Word word) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
      child: WordCard(word),
    );
  }

  Widget _buildListResults(List<Word> words) {
    if (words.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'No pathology words found.',
            style: Style.headlineDescription,
          ),
        ),
      );
    }

    return ListView.builder(
      // added  +1 to words.length because 0 is for _buildheader
      itemCount: words.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildHeader(context);
        } else {
          return _generateWordRow(
            words[index - 1],
          );
        }
      },
    );
  }

  //MARK: header
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Pathology Lexicon A-Z',
            style: Style.headlineText,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            softWrap: true,
            maxLines: 2,
            key: ValueKey('header-text'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: Style.plcGreenTheme,
                maxRadius: 16.0,
                child: Icon(
                  Icons.fastfood,
                  color: Style.scaffoldBackground,
                  semanticLabel: 'Include food-themed pathology words',
                ),
              ),
              const SizedBox(width: 12, height: 12),
              const Text(
                'Include food terms',
                style: Style.includeFoodTermsText,
              ),
              Switch(
                activeColor: Style.plcGreenTheme,
                value: _food,
                onChanged: (bool value) {
                  setState(() {
                    _food = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return CupertinoTabView(
      key: const ValueKey('list-screen'),
      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xffffffff)),
          child: _food == true
              ? _buildListResults(model.allWords)
              : _buildListResults(model.nonFoodWords),
        );
      },
    );
  }
}
