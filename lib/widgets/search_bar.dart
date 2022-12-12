// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:pathlexi/style.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  // ignore: use_key_in_widget_constructors
  const SearchBar({
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Style.searchBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 6,
        ),
        child: Row(
          children: [
            const ExcludeSemantics(
              child: Icon(
                CupertinoIcons.search,
                color: Style.searchIconColor,
              ),
            ),
            Expanded(
              child: CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 0.0,
                  color: Style.searchBackground,
                )),
                style: Style.searchText,
                cursorColor: Style.searchCursorColor,
                placeholder: 'Find a specific word',
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.clear();
              },
              child: const Icon(
                CupertinoIcons.clear_thick_circled,
                semanticLabel: 'Clear search terms',
                color: Style.searchIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
