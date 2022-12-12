// Copyright 2019-2021 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and liscense details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:scoped_model/scoped_model.dart';
import 'package:pathlexi/data/words.dart';

class AppState extends Model {
  final List<Word> _words;

  AppState() : _words = Word.words;

  List<Word> get allWords => List<Word>.from(_words);

  Word getWord(String name) => _words.singleWhere((v) => v.name == name);

  List<Word> get foodWords {
    return _words.where((v) => v.isFood == true).toList();
  }

  List<Word> get nonFoodWords {
    return _words.where((v) => v.isFood == false).toList();
  }

  List<Word> searchWords(String terms) => _words
      .where((v) => v.name!.toLowerCase().contains(terms.toLowerCase()))
      .toList();
}
