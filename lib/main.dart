// Copyright 2019-2022 Jurgen Geitner and UCT Pathology Learning Centre. All rights reserved.
// Portions of code are from https://github.com/flutter/samples/tree/master/veggieseasons by The Flutter team (copyright and liscense details below)
// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pathlexi/data/app_state.dart';
import 'package:pathlexi/screens/home.dart';
//import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:pathlexi/style.dart';

void main() {
  // Removing this to allow all orientations, see iPad bug
  /*
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  */

  runApp(
    ScopedModel<AppState>(
      model: AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'NotoSans',
          brightness: Brightness.light,
          primaryColor: Colors.teal[700],
          scaffoldBackgroundColor: Style.scaffoldBackground,
          errorColor: Style.errorSnackBarColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Style.plcGreenTheme),
        ),
        home: const HomeScreen(),
      ),
    ),
  );
}
