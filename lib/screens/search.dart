// Copyright 2019 - 2022 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and license details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pathlexi/data/app_state.dart';
import 'package:pathlexi/data/words.dart';
import 'package:pathlexi/style.dart';
import 'package:pathlexi/widgets/search_bar.dart';
import 'package:pathlexi/widgets/word_headline.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String terms = '';

  @override
  void initState() {
    super.initState();
    controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() => terms = controller.text);
  }

  Widget _createSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }

  Widget _buildSearchResults(List<Word> words) {
    if (words.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'No words matching your search terms were found.',
            style: Style.headlineDescription,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: WordHeadline(words[i]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return CupertinoTabView(
      key: const ValueKey('search-screen'),
      builder: (context) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            color: Style.scaffoldBackground,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _createSearchBox(),
                Expanded(
                  child: _buildSearchResults(model.searchWords(terms)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
