import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveTextButton extends StatelessWidget {
  final Function handleClick;
  final String title;
  AdaptiveTextButton(this.title, this.handleClick);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: handleClick)
          : TextButton(
              onPressed: handleClick,
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
